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
					//$subject = addslashes($subject);
					$message = $_POST['message']; 
					$message = str_replace("\n", "<br />", "$message");
					//$message = addslashes($message);
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
					
					
					$db = ($GLOBALS["___mysqli_ston"] = mysqli_connect($db_host,  $db_user,  $db_password, $db_name));
					if ($db == FALSE) {
						die("Errore nella connessione. Verificare i parametri nel file config.inc.php");
					}
					//((bool)mysqli_query( $db, "USE $db_name")) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
					
						
					//inserisco la  mail nella tabella mail
					$subject = mysqli_real_escape_string($db, subject);
					$message = mysqli_real_escape_string($db, message);
					$query = "INSERT INTO mail (id,oggetto,messaggio,associazione,data,inviare)
					VALUES (NULL,'" . $subject . "','" . $message . "','" . $intQuery . "',NULL,1);";
					$result = mysqli_query( $db, $query) or die(((is_object($db)) ? mysqli_error($db) : (($___mysqli_res = mysqli_connect_error()) ? $___mysqli_res : false)));
					
					echo '<p style="font-size: 16px; font-family: Arial; color: green;"<br/><br/>';
					echo 'Inoltro pianificato correttamente, l\'invio avverrà nella notte - E\' possibile chiudere la finestra adesso';
					echo '</p><br>';
					
}
?>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/nuovosito.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<?php 
require_once('dbconfig.php');
?>
<title>Autoscuola Eurodrive Firenze</title>
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
<link href="../generale.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/JavaScript" src="../wysiwyg/wysiwyg.js"></script>
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#babbbd">
<div id="header">
<table><tr><td align="center">
<div id="header"><!-- InstanceBeginEditable name="testata" -->
  <table border="0">
    <tr>
      <td><img src="../Grafica/JPG/testatanew.jpg" width="1097" height="142" border="0" usemap="#Map" />
          <map name="Map" id="Map">
            <area shape="rect" coords="12,63,267,137" href="../nauticahome.php" />
            <area shape="rect" coords="852,63,1090,138" href="../guidahome.php" />
        <area shape="rect" coords="370,4,716,135" href="../default.php" />
          </map></td>
    </tr>
  </table>
<!-- InstanceEndEditable --></div>
</td>
</tr>
<tr><td><!-- InstanceBeginEditable name="subheader" -->
  <div id="subheader"><img src="../Grafica/JPG/insinteressi.jpg" width="1100" height="77" /></div>
<!-- InstanceEndEditable --></td></tr>
<tr>
<td>
<table border="0">
<tr>
  <td><!-- InstanceBeginEditable name="sommario" -->
    <div id="precontenuti"></div>
    <!-- InstanceEndEditable -->
    <div id="contenuti">
  <table border="0" width="100%">
  <tr>
  <td valign="top"><!-- InstanceBeginEditable name="contenuti1" -->
  <div id="contenuti3">
  
  <script type="text/javascript">
function conferma(form){
  if (confirm("Vuoi veramente eliminare questo interesse?")){
    form.submit();
  }
}
</script>

<?php
session_start();

  $link=($GLOBALS["___mysqli_ston"] = mysqli_connect(DBHOST, DBUSER, DBPASS));
((bool)mysqli_query($link, "USE " . constant('DBNAME')));

// Inserimento dei dati nel Database ------------------------------------------------------------
if ($_POST['inserisci']==1){
$nome=$_POST['nome'];

  

 if (mysqli_query($GLOBALS["___mysqli_ston"], "insert into interessi (nome) values ('".$nome."')")){
    echo "<b>Interesse inserito correttamente</b><br>";
  }
}
// Fine inserimento ------------------------------------------------------------


// Inizio Elimina Interesse------------------------------------------------------------

if ($_POST['elimina']==1){
  $id=$_POST['id'];
  
	$result=mysqli_query($GLOBALS["___mysqli_ston"], "select img from interessi where id='".$id."'");
	$riga=mysqli_fetch_array($result);
	$target=$riga[0];
	$result=mysqli_query($GLOBALS["___mysqli_ston"], "select count(*) from interessi where img='".$target."'");
	$riga=mysqli_fetch_array($result);
  
  if (mysqli_query($GLOBALS["___mysqli_ston"], "delete from interessi where id='".$id."'")){
    echo "<b>Documento eliminato</b><br>";
  }
}

//Fine Elimina Interesse -----------------------------------------------------------


// INIZIO Fieldset Inserimento notizie

echo '<fieldset style="width: 700px;"><legend><b><i><font color="#666666" size=3>&nbsp;&nbsp;Inserimento INTERESSI per NEWSLETTER&nbsp;&nbsp;</b></i></font></legend><p><font  size="3"><b>
<form method="post" action="interessi.php" enctype="multipart/form-data">';

echo '<input type="hidden" name="inserisci" value="1">
<table border="0">
<tr>
<td>Interesse</td><td><input type="text" name="nome" size="60"></td>
</tr><tr><td colspan="2">	<input name="Ok" type="submit" value="Inserisci"></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><td colspan="2"><a class=link2 href="sendletter.php">Invio Newsletter</a></td></tr>
      	</table></form>
</fieldset> ';

//FINE Fieldset inserimento notizie

// INIZIO Fieldset di eliminazione Interessi

echo '<br><br><fieldset style="width: 700px;"><legend><b>&nbsp;&nbsp;&nbsp;<font color="#666666"> Eliminazione INTERESSI&nbsp;&nbsp;&nbsp;</b></legend>';
$color=0;
$query="select * from interessi order by nome";
$result=mysqli_query($GLOBALS["___mysqli_ston"], $query);
do {
  if ($color%2==0){
          $bgcolor="#FFF";
        }
  else{
    $bgcolor="#d5d5d5";
  }

  $riga=mysqli_fetch_array($result);
  if ($riga){
  $data_tendina=explode("-",$riga[1]);

echo '<table border="0" width="700" cellpadding="3" bgcolor="'.$bgcolor.'">
      <form method="post" name="form'.$color.'" action="interessi.php" method="post" enctype="multipart/form-data">';
    
      
echo '<input type="hidden" name="id" value="'.$riga[0].'">
      <input type="hidden" name="elimina" value="1">
      <tr>
	  <td class=link2>'.$riga['nome'].'</td>
      <td align="right" valign="top">
      <a class=link2 href="#" onclick="javascript: conferma(document.forms.form_elimina'.$color.');">Elimina</a>
      </td></form>
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
  <!-- InstanceEndEditable --></td></tr>
</table>
</div>
<div id="postcontenuti"></div>
<div id="footer">Copyrights 2015 Autoscuola Eurodrive Firenze. Camera di Commercio di Firenze n° 55043/1998 del 03/08/1998 - P. I.V.A. 05068030484 <br>All Rights Are Reserved. Web Design and Application by Globe-it S.R.L. </div>

</body>
<!-- InstanceEnd --></html>
