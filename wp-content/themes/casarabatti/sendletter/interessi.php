<?php
session_start();
//fine funzione di scrittura numeri
require_once "config.inc.php";
require_once "swift/lib/swift_required.php";
require_once "log.php";

?>

<?php
if (isset($_POST['submit'])) {
					// se il form  stato inviato
					// recupero i dati inviati
					$subject = isset($_POST['subject']) ? trim($_SESSION['subject']) : '';//why this?
					$message = isset($_POST['message']) ? trim($_SESSION['message']) : '';//why this???
					$subject = $_POST['subject']; 
					$subject = addslashes($subject);
					$message = $_POST['message']; 
					$message = str_replace("\n", "<br />", "$message");
					$message = addslashes($message);
					$date = date('d-m-Y H:i', time());
					$interesse = $_POST['interessi'];
					$interessiTutti= $_POST['interessiTutti'];
					// controlla che i campi non siano vuoti
					$error = array();
					if ($subject == '') {
						$error [] = ('Non hai inserito l\'oggetto.');
						$_SESSION['error'] = '1';
						$_SESSION['message_back'] = $message;
						$_SESSION['interesse_back'] = $interesse;
						$_SESSION['interessiTutti_back'] = $interessiTutti;
						unset($_POST['submit']);
					}
					if ($message == '') {
						$error [] = ('Non hai inserito il tuo messaggio.');
						$_SESSION['error'] = '1';
						$_SESSION['subject_back'] = $subject;
						$_SESSION['interesse_back'] = $interesse;
						$_SESSION['interessiTutti_back'] = $interessiTutti;
						unset($_POST['submit']);
					}
					//aggiunge i risultati del checkbox				    
					if (empty($interesse) && empty ($interessiTutti)) {
						$error [] = ('Non hai selezionato nessun interesse.');
						$_SESSION['error'] = '1';
						$_SESSION['subject_back'] = $subject;
						$_SESSION['message_back'] = $message;
						unset($_POST['submit']);
					}	
						
					//se la sessione restituisce errore ritorno alla pagina con il set di error=1
					if ($_SESSION['error'] == '1') {
						header('Location:sendletter.php?error=' . join($error, urlencode('<br/>')));
						exit;
					}
					$intQuery="";
					if($interessiTutti=='Tutti'){
						$intQuery="0";
// 						$query = 'SELECT DISTINCT mail, id FROM soci WHERE mail is not null and trim(mail) not in ("")' ;
// 						$result = mysql_query($query) or die(mysql_error());
					}else{
						//count interessi selezionati
						$Nint = count($interesse);
						for($i=0; $i < $Nint-1; $i++)
						{
							$intQuery .= $interesse[$i] . ",";
						}
						$intQuery .= $interesse[$Nint-1];
						
// 						$query = 'SELECT DISTINCT mail, soci.id FROM soci, interessi_soci WHERE id_interesse IN (' . $intQuery . ') AND soci.id=id_socio AND mail is not null and trim(mail) not in ("")' ;			
// 						$result = mysql_query($query) or die(mysql_error());
					}
					
					
					$db = mysql_connect($db_host, $db_user, $db_password);
					if ($db == FALSE) {
						die("Errore nella connessione. Verificare i parametri nel file config.inc.php");
					}
					mysql_select_db($db_name, $db) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
					
						
					//inserisco la  mail nella tabella mail
					$query = "INSERT INTO mail (id,oggetto,messaggio,associazione,data,inviare)
					VALUES (NULL,'" . $subject . "','" . $message . "','" . $intQuery . "',NULL,1);";
					$result = mysql_query($query, $db) or die(mysql_error($db));
					
					echo '<p style="font-size: 16px; font-family: Arial; color: green;"<br/><br/>';
					echo 'Inoltro pianificato correttamente, l\'invio avverrà nella notte - E\' possibile chiudere la finestra adesso';
					echo '</p><br>';
					
}
?>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/principale.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>HOLISTIC REMEDIES</title>
<!-- InstanceEndEditable -->
<link href="../generale.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/JavaScript" src="wysiwyg/wysiwyg.js"></script>
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</head>

<body bgcolor="#62643f" topmargin="0">
<div id="wrapper">
<div id="header"><img src="../Grafica/JPG/testata.jpg" width="1100" height="108" /></div>
<div id="subheader1">
<table width="100%">
  <tr>
    <td width="3%"><img src="../Grafica/ghost.gif" width="76" height="170" /></td>
    <td width="95%">&nbsp;</td>
    <td width="2%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><img src="../Grafica/JPG/sommario.jpg" width="190" height="140" border="0" usemap="#Map" /></td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>


<div id="subheader2">
  <table width="100%" border="0" cellspacing="0" cellpadding="3">
    <tr>
      <td width="7%"><img src="../Grafica/ghost.gif" width="76" height="14" /></td>
      <td width="5%" valign="top"><a href="../ENG/Defaulteng.htm"><img src="../Grafica/JPG/eng.jpg" width="44" height="33" border="0" /></a></td>
      <td width="29%"><img src="../Grafica/ghost.gif" width="312" height="8" /></td>
      <td width="59%"><p><img src="../Grafica/JPG/hel.jpg" width="173" height="54" /></p>        </td>
    </tr>
  </table>
</div>
<!-- InstanceBeginEditable name="Contenuti" -->
<div id="contenuti_mail">
<center>
<div id="contenuti_mail">
<script type="text/javascript">
function conferma(form){
  if (confirm("Vuoi veramente eliminare questo interesse?")){
    form.submit();
  }
}
</script>

<?php
session_start();

include_once 'db_connection.php';

// Inserimento dei dati nel Database ------------------------------------------------------------
if ($_POST['inserisci']==1){
$nome=$_POST['nome'];

  

 if (mysql_query("insert into interessi (nome) values ('$nome')")){
    echo "<b>Interesse inserito correttamente</b><br>";
  }
}
// Fine inserimento ------------------------------------------------------------


// Inizio Elimina Interesse------------------------------------------------------------

if ($_POST['elimina']==1){
  $id=$_POST['id'];
  
	$result=mysql_query("select img from interessi where id='$id'");
	$riga=mysql_fetch_array($result);
	$target=$riga[0];
	$result=mysql_query("select count(*) from interessi where img='$target'");
	$riga=mysql_fetch_array($result);
  
  if (mysql_query("delete from interessi where id='$id'")){
    echo "<b>Documento eliminato</b><br>";
  }
}

//Fine Elimina Interesse -----------------------------------------------------------


// INIZIO Fieldset Inserimento notizie

echo '<fieldset style="width: 700px;"><legend><b><i><font color="#666666" size=2>&nbsp;&nbsp;Inserimento INTERESSI per NEWSLETTER&nbsp;&nbsp;</b></i></font></legend><p><font  size="2"><b>
<form method="post" action="interessi.php" enctype="multipart/form-data">';

echo '<input type="hidden" name="inserisci" value="1">
<table border="0">
<tr>
<td>Interesse</td><td><input type="text" name="nome" size="60"></td>
</tr><tr><td colspan="2">	<input name="Ok" type="submit" value="Inserisci"></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><td colspan="2"><a class=link3 href="sendletter.php">Invio Newsletter</a></td></tr>
      	</table></form>
</fieldset> ';

//FINE Fieldset inserimento notizie

// INIZIO Fieldset di eliminazione Interessi

echo '<br><br><fieldset style="width: 700px;"><legend><b>&nbsp;&nbsp;&nbsp;<font color="#666666"> Eliminazione INTERESSI&nbsp;&nbsp;&nbsp;</b></legend>';
$color=0;
$query="select * from interessi order by nome";
$result=mysql_query($query);
do {
  if ($color%2==0){
          $bgcolor="#FFF";
        }
  else{
    $bgcolor="#d5d5d5";
  }

  $riga=mysql_fetch_array($result);
  if ($riga){
  $data_tendina=explode("-",$riga[1]);

echo '<table border="0" width="700" cellpadding="3" bgcolor="'.$bgcolor.'">
      <form method="post" name="form'.$color.'" action="interessi.php" method="post" enctype="multipart/form-data">';
    
      
echo '<input type="hidden" name="id" value="'.$riga[0].'">
      <input type="hidden" name="elimina" value="1">
      <tr>
	  <td class=link3>'.$riga['nome'].'</td>
      <td align="right" valign="top">
      <a class=link3 href="#" onclick="javascript: conferma(document.forms.form_elimina'.$color.');">Elimina</a>
      </td></tr></table></form>
	  <form name="form_elimina'.$color.'" action="interessi.php" method="post">
      <input type="hidden" name="elimina" value="1">
      <input type="hidden" name="id" value="'.$riga[0].'"></form></tr>
      </table>';
  

$color++;
}
}while($riga);
echo '</blockquote>
      </fieldset>'
	  
// FINE Fieldset della modifica	  

?>

</div>
</center>
</div>
<!-- InstanceEndEditable -->
<div id="footer">
  <div align="center">Caisse Formula &egrave; un integratore alimentare prodotto da: Herb Works - Guelph Ontario - Canada
    <br />
    Distribuito in Italia da: Holistic Remedies - Via Piave, 99 - 50068 Rufina (Firenze)<br />  
    Tel.: +39.055. 8395388 - Fax: +39.055.8395989 -  Mail: info@caisse.it 
    
    <br />
    <br />
    <br />
    Iscrizione REA Firenze 503598 - Registro Imprese 19717 - P. IVA 04957430483</div>
</div>





</div>

<map name="Map" id="Map">
  <area shape="rect" coords="1,31,59,50" href="../Default.htm" />
<area shape="rect" coords="2,57,157,77" href="../ITA/consigli.htm" />
<area shape="rect" coords="3,80,103,102" href="../ITA/formula.htm" />
<area shape="rect" coords="1,108,63,128" href="../holisticecommerce/index.php" />
</map></body>
<!-- InstanceEnd --></html>
