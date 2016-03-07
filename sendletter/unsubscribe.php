<?php
session_start();
//fine funzione di scrittura numeri
require_once "config.inc.php";
include "swift/lib/swift_required.php";
include "log.php";
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/sendletter2.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>CAM - Centro Attivit&agrave; Musicali</title>
<!-- InstanceEndEditable -->
<script language="JavaScript" type="text/JavaScript">

<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<script language="JavaScript" type="text/JavaScript" src="../../wysiwyg/wysiwyg.js"></script>
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
<link href="../../nuovosito.css" rel="stylesheet" type="text/css" />
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#000033" onLoad="MM_preloadImages('../../grafica/jpg/scuolaOn.jpg','../../grafica/jpg/produzioniOn.jpg','../../grafica/jpg/iniziativeOn.jpg','../../grafica/jpg/insegnantiOn.jpg','../../grafica/jpg/associazioneOn.jpg','../../grafica/jpg/iscrittiOn.jpg','../../grafica/jpg/segreteriaOn.jpg','../../grafica/jpg/fotoOn.jpg','../../grafica/jpg/homeOn.jpg')">
<div id="header">
<table><tr><td align="center"><img src="../../Grafica/jpg/testata.jpg" alt="CAM - Centro Attivit&agrave; Musicali" width="990" height="172" border="0" /><br />
<a href="../../scuola.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('associazione','','../../grafica/jpg/associazioneOn.jpg',1)"><img src="../../grafica/jpg/associazione.jpg" alt="L'Associazione" name="associazione" border="0" width="107" height="28" /></a>
<a href="../../insegnanti.php" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('insegnanti','','../../grafica/jpg/insegnantiOn.jpg',1)"><img src="../../grafica/jpg/insegnanti.jpg" alt="Insegnanti" name="insegnanti" border="0" width="114" height="28" /></a><a href="../../corsi.php" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('scuola','','../../grafica/jpg/scuolaOn.jpg',1)"><img src="../../grafica/jpg/scuola.jpg" alt="La Scuola" name="scuola" border="0" width="114" height="28" /></a><a href="../../produzioni.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('produzioni','','../../grafica/jpg/produzioniOn.jpg',1)"><img src="../../grafica/jpg/produzioni.jpg" alt="Le Produzioni" name="produzioni" border="0" width="114" height="28" /></a>
<a href="../../iniziative.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('iniziative','','../../grafica/jpg/iniziativeOn.jpg',1)"><img src="../../grafica/jpg/iniziative.jpg" alt="Iniziative" name="iniziative" border="0" width="114" height="28" /></a><a href="../../iscritti.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('iscritti','','../../grafica/jpg/iscrittiOn.jpg',1)"><img src="../../grafica/jpg/iscritti.jpg" alt="Iscritti" name="iscritti" border="0" width="114" height="28" /></a>
<a href="../../segreteria.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('segreteria','','../../grafica/jpg/segreteriaOn.jpg',1)"><img src="../../grafica/jpg/segreteria.jpg" alt="Segreteria" name="segreteria" border="0" width="114" height="28" /></a>
<a href="../../fotogallery.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('fotogallery','','../../grafica/jpg/fotoOn.jpg',1)"><img src="../../grafica/jpg/foto.jpg" alt="Fotogallery" name="fotogallery" border="0" width="114" height="28" /></a>
<a href="../../Default.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('home','','../../grafica/jpg/homeOn.jpg',1)"><img src="../../grafica/jpg/home.jpg" alt="Homepage" name="home" border="0" width="52" height="28" /></a>
</td>
</tr></table>
</div>
<div id="wrapper">

<!-- InstanceBeginEditable name="Contenuti" -->
<div id="contenuti_send">
<table border="0">
			<tr>
			  <td valign="top"><?php
				echo '<center></center><p>';
				if (isset($_POST['submit'])) {
					$db = ($GLOBALS["___mysqli_ston"] = mysqli_connect($db_host,  $db_user,  $db_password)) or
					die("Errore nella connessione. Verificare i parametri nel file config.inc.php");

					((bool)mysqli_query( $db, "USE $db_name")) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
					
					$mail = trim($_POST['mail']) ;				
					$query = "select id FROM soci WHERE mail='" .$mail ."' ;";
					$result = mysqli_query($db, $query) or die(((is_object($db)) ? mysqli_error($db) : (($___mysqli_res = mysqli_connect_error()) ? $___mysqli_res : false)));
					
					if($row = mysqli_fetch_assoc($result)){
						$id = $row['id']; //if the id is in
						$query = "DELETE FROM soci WHERE id ='". $id. "';";
						$result = mysqli_query($db, $query) or die (((is_object($db)) ? mysqli_error($db) : (($___mysqli_res = mysqli_connect_error()) ? $___mysqli_res : false)));
						$query = "DELETE FROM interessi_soci WHERE id_socio ='" .$id . "';";
						$result = mysqli_query($db, $query) or die (((is_object($db)) ? mysqli_error($db) : (($___mysqli_res = mysqli_connect_error()) ? $___mysqli_res : false)));
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
</div>
<!-- InstanceEndEditable -->

<div id="footer">
  CAM - Centro Attivit&agrave; musicali - <strong>Firenze - via Monsignor Leto Casini 11</strong> - Tel. 055676064&nbsp; - E-mail: <a class="link" href="mailto: info@camfirenze.net">info@camfirenze.net</a>
  </div>



</div>

</body>
<!-- InstanceEnd --></html>
