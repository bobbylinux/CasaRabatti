<?php
session_start();
require_once "config.inc.php";
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/sito.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Title</title>
<!-- InstanceEndEditable -->
<link href="generale.css" rel="stylesheet" type="text/css" />
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</head>

<body topmargin="0" bgcolor="#1b7a9a">
<div id="wrapper">
<table border="1">
<tr>
<td valign="top">
<div id="contenuti"><!-- InstanceBeginEditable name="contenuti" -->
<script type="text/javascript">
function conferma(id){
  if (confirm("Vuoi veramente eliminare questo iscritto?")){
    location.href="iscritti.php?del="+id;
  }
}
</script>
<?php
if (true){ //$_SESSION['login']==1
	if ($_SESSION['power']==1){
	}
	else{
	}
	// crea la lista dei soci
	$db = mysql_connect($db_host, $db_user, $db_password);
	if ($db == FALSE) {
		die("Errore nella connessione. Verificare i parametri nel file config.inc.php");
	}
	mysql_select_db($db_name, $db) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
	
	echo '<fieldset><legend>&nbsp;&nbsp;&nbsp;<font color="white" size=2><b> Elenco Iscritti alla Mailing list </b>&nbsp;&nbsp;&nbsp;<a class=link href="sendletter.php"><b>Torna alla Mailing</b>&nbsp;&nbsp;</legend>';
	
	if ($_GET['del']!=""){
	  $id=$_GET['del'];
	  mysql_query("delete from soci where id='$id'");
	  mysql_query("delete from interessi_soci where id_socio='$id'");
	  echo '<script type="text/javascript">
	      	<!--
	      	function doRedirect() { //funzione con il link alla pagina che si desidera raggiungere
	      	location.href = "iscritti.php";
	      	}
	      	window.setTimeout("doRedirect()", 0); //Fa partire il redirect dopo tot. secondi
	      	//-->
	      	</script>';
	}
	else{
		$result=mysql_query("select id,nome,mail from soci order by mail");
		$riga=mysql_fetch_array($result);
		$i=0;
		while ($riga){
		  echo '<table width=100% border="0"><tr><form name="form'.$i.'" action="iscritti.php" method="post"><input type="hidden" name="step1" value="'.$riga['id'].'">
		        <td valign="top" width="200">'.$riga['nome'].'</td><td valign="top">'.$riga['mail'].'</td>
		        <td valign="top" width="55"><a class=link href="javascript:void(0);" onclick="conferma('.$riga['id'].');">Elimina</a></td></tr>
		        </form>';
		  $i++;
		  $riga=mysql_fetch_array($result);
		}
	}
	echo '</table></fieldset>';
	}
else{
  echo "Non siete autorizzati ad accedere a questa pagina";
}


?><!-- InstanceEndEditable --></div>
</td>
</tr><tr>
<td align='center'>
<div id="footer">
  <!-- Inizio Codice ShinyStat -->
	<script type="text/javascript" src="http://codice.shinystat.com/cgi-bin/getcod.cgi?USER=lucabenci"></script>
	<noscript>
	<a href="http://www.shinystat.com/it" target="_top">
	<img src="http://www.shinystat.com/cgi-bin/shinystat.cgi?USER=lucabenci" alt="Utenti online" border="0" /></a>
	</noscript>
<!-- Fine Codice ShinyStat --></div></td>

</tr>
</table>
</div>
</body><!-- InstanceEnd -->