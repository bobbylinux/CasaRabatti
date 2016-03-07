<?php
chdir(dirname(__FILE__));

require_once "config.inc.php";
include "swift/lib/swift_required.php";
include "log.php";




// crea la lista destinatari
$db = ($GLOBALS["___mysqli_ston"] = mysqli_connect($db_host,  $db_user,  $db_password));
if ($db == FALSE) {
	die("Errore nella connessione. Verificare i parametri nel file config.inc.php " . $db_host);
}
((bool)mysqli_query( $db, "USE $db_name")) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");

//empty the DB
$query = 'DELETE FROM wrongmail' ;
$result = mysqli_query($GLOBALS["___mysqli_ston"], $query) or die(((is_object($GLOBALS["___mysqli_ston"])) ? mysqli_error($GLOBALS["___mysqli_ston"]) : (($___mysqli_res = mysqli_connect_error()) ? $___mysqli_res : false)));

//read all address from the DB
$query = 'SELECT DISTINCT id, nome, mail FROM soci' ;
$result = mysqli_query($GLOBALS["___mysqli_ston"], $query) or die(((is_object($GLOBALS["___mysqli_ston"])) ? mysqli_error($GLOBALS["___mysqli_ston"]) : (($___mysqli_res = mysqli_connect_error()) ? $___mysqli_res : false)));


//parto il ciclo di lettura degli indirizzi
$log_error = new log();

try {
	while ($row = mysqli_fetch_assoc($result)) { //per ogni riga sul db
			$destinatari = $row['mail'];
			
			if(!Swift_Validate::email($destinatari)){ //validate email
				$id_utente = $row['id'];
				$nome = $row['nome'];
				$query_log = 'INSERT INTO wrongmail (id, nome, email )
				VALUES (' . $id_utente . ',"' . $nome . '","' . $destinatari . '")';
				echo $id_utente . ', ' . $nome . ', ' . $destinatari . '<BR>';
				$result_log_mail= mysqli_query($GLOBALS["___mysqli_ston"], $query_log);
			}
	}
} catch (Exception $e) {
	$log_error->scrivi_errori($e->getMessage() . ';');
}

$log_error-> close();
echo 'done';
?>
