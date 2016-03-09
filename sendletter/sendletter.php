<?php
session_start();
//fine funzione di scrittura numeri
require_once "config.inc.php";
require_once "swift/lib/swift_required.php";
require_once "log.php";

?>

<?php
if (isset($_POST['submit'])) {

					$db = ($GLOBALS["___mysqli_ston"] = mysqli_connect($db_host,  $db_user,  $db_password));
					if ($db == FALSE) {
						die("Errore nella connessione. Verificare i parametri nel file config.inc.php");
					}
					((bool)mysqli_query( $db, "USE $db_name")) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
					// se il form  stato inviato
					// recupero i dati inviati
					$subject = isset($_POST['subject']) ? trim($_SESSION['subject']) : '';//why this?
					$message = isset($_POST['message']) ? trim($_SESSION['message']) : '';//why this???
					$subject = $_POST['subject']; 
					$subject = mysqli_real_escape_string($db, $subject);
					$message = $_POST['message']; 
					$message = str_replace("\n", "<br />", "$message");
					$message = mysqli_real_escape_string($db, $message);
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
					
					
					
					
						
					//inserisco la  mail nella tabella mail
					$query = "INSERT INTO mail (id,oggetto,messaggio,associazione,data,inviare)
					VALUES (NULL,'" . $subject . "','" . $message . "','" . $intQuery . "',NULL,1);";
					$result = mysqli_query( $db, $query) or die(((is_object($db)) ? mysqli_error($db) : (($___mysqli_res = mysqli_connect_error()) ? $___mysqli_res : false)));
					
					echo '<p style="font-size: 16px; font-family: Arial; color: green;"<br/><br/>';
					echo 'Inoltro pianificato correttamente, l\'invio avverrà nella notte - E\' possibile chiudere la finestra adesso';
					echo '</p><br>';
					
}
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
<?php
				 
					//gestico l'errore
					if (isset($_GET['error']) && $_GET['error'] != ''){
						echo '<div id="error">ERROR: ' . $_GET['error'] . '</div>';
					}else{
						unset($_SESSION['subject_back']);
						unset($_SESSION['message_back'] ); //$message;
						unset($_SESSION['interesse_back']);
						unset($_SESSION['interessiTutti_back']);
					}
					unset($_SESSION['error']);
					$main .="
                                        <form action='sendletter.php' method='post'>
					<table class='maintable' >
				
					<tr class='mainrow'>
					<td style='text-align:right;'>
					<b>Oggetto:</b>
					<td><input type='text' name='subject' size='80' value='" . $_SESSION['subject_back'] . "'></td>									
					<tr class='mainrow'>
					<td style='text-align:right;'><b>Invia a: </b></td>
					";
					$main .="
					<td>
						<input type='checkbox' name='interessiTutti' value='Tutti' ";
					if($_SESSION['interessiTutti_back']=="Tutti"){
						$main .="checked";
					}
					$main .="> Tutti \n";
					$main .="</td>
					<tr class='mainrow'>
					<td></td>
					<td>
					";			
					$db = ($GLOBALS["___mysqli_ston"] = mysqli_connect($db_host,  $db_user,  $db_password)) or
					die("Errore nella connessione. Verificare i parametri nel file config.inc.php");

					((bool)mysqli_query( $db, "USE $db_name")) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");

					$result = mysqli_query($GLOBALS["___mysqli_ston"], 'SELECT ID, nome FROM interessi order by nome') or die(((is_object($GLOBALS["___mysqli_ston"])) ? mysqli_error($GLOBALS["___mysqli_ston"]) : (($___mysqli_res = mysqli_connect_error()) ? $___mysqli_res : false)));
					//$main .= "<input type='checkbox' name='nome' value='valore'> interesse";
					$tabCounter=0;
					$main .="<table width=590>
					<col width='25%'><col width='25%'><col width='25%'><col width='25%'>
					";
					while ($row = mysqli_fetch_assoc($result)) {
						if(($tabCounter % 4) == 0){
							$main .="<tr>";
						}
						$main .="<td>";
						$main .= "<input type='checkbox' name='interessi[]'";
						$main .= " value='" . $row['ID'] . "'";
						$isIn = false;
						$Nint = count($_SESSION['interesse_back']);
						for($i=0; $i < $Nint; $i++)
						{
							if ($row['ID'] == $_SESSION['interesse_back'][$i])
								$isIn = true;
						}
						if($isIn){
							$main .= " checked";
						}
						$main .= ">" . $row['nome'] . "\n";
						$main .="</td>";
						if(($tabCounter % 4) == 3){
							$main .="</tr>";
						}
						$tabCounter ++;
					}
					
					 $main .= "</table>
					</td>
				    </tr> 
				    </td>
				    </tr>
					<tr><td colspan='2'><hr></td></tr>
					<tr><td colspan='2' align='center'><a class=link2 href='interessi.php'>Inserimento nuovi interessi</a></td></tr>
					<tr><td colspan='2'><hr></td></tr>
				    <tr class='mainrow'>
				    <td style='text-align:right;'></td>
				    <td>
					<textarea name='message' rows='20' cols='100' id='7'>" . $_SESSION['message_back'] . "</textarea>
					</td>
					<tr class='mainrow'>
					<script language='JavaScript'>
					generate_wysiwyg('7');
					</script>
					<td ></td >
					<td >
					<input type='submit' name='submit' value='Invia'>
					</td>
					</tr>		
					</table>
                                        
				</form>";
					 //<tr><td colspan='2'><p><a href='iscritti.php' target='_blank'>VISUALIZZA TUTTI GLI ISCRITTI</a></p></td></tr>	
					//$retiniset = ini_set("max_execution_time",30);

					 if($msgok){
					 	echo '<p style="font-size: 16px; font-family: Arial; color: black;">'.$msgok.' emails inviate correttamente<br/><br/>';
					 	//echo $msgok;
					 }
					echo $main;

				?>
</div>
<!-- InstanceEndEditable -->

<div id="footer">
  CAM - Centro Attivit&agrave; musicali - <strong>Firenze - via Monsignor Leto Casini 11</strong> - Tel. 055676064&nbsp; - E-mail: <a class="link" href="mailto: info@camfirenze.net">info@camfirenze.net</a>
  </div>



</div>

</body>
<!-- InstanceEnd --></html>
