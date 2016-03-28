<?php
session_start();
//fine funzione di scrittura numeri
require_once "config.inc.php";
?>

<?php
$db = mysql_connect($db_host, $db_user, $db_password);
if ($db == FALSE) {
	die("Errore nella connessione. Verificare i parametri nel file config.inc.php");
}
mysql_select_db($db_name, $db) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");

$nome=$_GET['nome'];
$mail=$_GET['mail'];
$mail=strtolower($mail);
$array_interessi=explode('~',$_GET['interessi']);

//check for another record with the same email
$result=mysql_query("SELECT id FROM soci WHERE mail='" .$mail ."'");
if(!mysql_fetch_array($result)){
	mysql_query("INSERT INTO soci (nome,mail) values ('$nome','$mail')");
	echo 'nome e email: '.$nome.' '.$mail."\n";
}

$result=mysql_query("SELECT id FROM soci WHERE mail='" .$mail ."'");
$riga=mysql_fetch_array($result);
$id_socio=$riga['id'];


for($i=0;$i<count($array_interessi);$i++){
  $id_interesse=$array_interessi[$i];
  mysql_query("INSERT into interessi_soci (id_socio,id_interesse) values ('$id_socio','$id_interesse')");
  echo 'socio e interesse: '.$id_socio.', '.$id_interesse."\n";
}

echo 'Dati inseriti correttamente';


?>

