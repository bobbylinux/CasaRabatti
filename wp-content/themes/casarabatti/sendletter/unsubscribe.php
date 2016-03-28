<?php
session_start();
//fine funzione di scrittura numeri
require_once "config.inc.php";
include "swift/lib/swift_required.php";
include "log.php";
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
<div id="contenuti">
<center>
<table border="0">
			<tr>
			  <td valign="top"><?php
				echo '<center></center><p>';
				if (isset($_POST['submit'])) {
					$db = mysql_connect($db_host, $db_user, $db_password) or
					die("Errore nella connessione. Verificare i parametri nel file config.inc.php");

					mysql_select_db($db_name, $db) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
					
					$mail = trim($_POST['mail']) ;				
					$query = "select id FROM soci WHERE mail='" .$mail ."' ;";
					$result = mysql_query($query,$db) or die(mysql_error($db));
					
					if($row = mysql_fetch_assoc($result)){
						$id = $row['id']; //if the id is in
						$query = "DELETE FROM soci WHERE id ='". $id. "';";
						$result = mysql_query($query,$db) or die (mysql_error($db));
						$query = "DELETE FROM interessi_soci WHERE id_socio ='" .$id . "';";
						$result = mysql_query($query,$db) or die (mysql_error($db));
						echo '<font color="#666666"><h2>Cancellazione effettuata correttamente</h2></font>';							
						
					} else {
						echo "
						<form action='unsubscribe.php' method='post'>
						<div>
							<div id='titolo'><h2>Indirizzo non valido</h2></div>
							<div id='label'>inserisci la tua mail:</div>
							<div id='input'><input type='text' size='50' value='' name='mail' id='mail'/></div>
							<div id='submit'><input type='submit' value='Invia' name='submit'/></div>
						</div>
						</form>";
					}	
				} else {
				echo "
					<form action='unsubscribe.php' method='post'>
					<div>
						<div id='titolo'><h1>Cancellazione newsletter</h1></div>
						<div id='sottotitolo'><h3>NON VUOI PIU' RICEVERE LA NEWSLETTER?</h3></div>
						<div id='label'>inserisci la tua mail:</div>
						<div id='input'><input type='text' size='50' value='' name='mail' id='mail'/></div>
						<div id='submit'><input type='submit' value='Invia' name='submit'/></div>
					</div>
					</form>";
				}
				echo $main;

				?>
				</td>
			</tr>
			</table>
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
