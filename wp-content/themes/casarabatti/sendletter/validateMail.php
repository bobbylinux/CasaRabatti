<?php
chdir(dirname(__FILE__));

require_once "config.inc.php";
include "swift/lib/swift_required.php";
include "log.php";




// crea la lista destinatari
$db = mysql_connect($db_host, $db_user, $db_password);
if ($db == FALSE) {
	die("Errore nella connessione. Verificare i parametri nel file config.inc.php " . $db_host);
}
mysql_select_db($db_name, $db) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");

//empty the DB
$query = 'DELETE FROM wrongmail' ;
$result = mysql_query($query) or die(mysql_error());

//read all address from the DB
$query = 'SELECT DISTINCT id, nome, mail FROM soci' ;
$result = mysql_query($query) or die(mysql_error());


//parto il ciclo di lettura degli indirizzi
$log_error = new log();

try {
	while ($row = mysql_fetch_assoc($result)) { //per ogni riga sul db
			$destinatari = $row['mail'];
			
			if(!Swift_Validate::email($destinatari)){ //validate email
				$id_utente = $row['id'];
				$nome = $row['nome'];
				$query_log = 'INSERT INTO wrongmail (id, nome, email )
				VALUES (' . $id_utente . ',"' . $nome . '","' . $destinatari . '")';
				echo $id_utente . ', ' . $nome . ', ' . $destinatari . '<BR>';
				$result_log_mail= mysql_query($query_log);
			}
	}
} catch (Exception $e) {
	$log_error->scrivi_errori($e->getMessage() . ';');
}

$log_error-> close();
echo 'done';
?>
