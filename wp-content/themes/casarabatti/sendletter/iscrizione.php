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

<p align="center" class="footer"><strong>Se siete interessati a ricevere informazioni da Holistic Remedies </strong></p>
<p align="center" class="footer"><strong>iscrivetevi alla nostra mailing 
  list.</strong></p>
  <center>
<?php
      $db = mysql_connect($db_host, $db_user, $db_password);
      if ($db == FALSE) {
      	die("Errore nella connessione. Verificare i parametri nel file config.inc.php");
      }
      mysql_select_db($db_name, $db) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
      
      if($_POST['invia']==1){
        $nome=$_POST['nome'];
        $mail=$_POST['mail'];
        $mail=trim($mail, " \t\n\r\0\x0B,;");
      //  $interesse = $_POST['interessi'];
        
        //log new address
        $log_add = new log();
        $log_add->log_address($mail);
        
        //Send message to administrator
        $messaggio='<table border="0"><tr>
            <td>Nome e Cognome</td><td>'.$nome.'</td></tr><tr>
            <td>E-mail</td><td>'.$mail.'</td></tr><tr>
         <!--   <td valign="top">&Egrave; interessato a:</td> --> <td>';
        //add interessi to the mail
        $arrayInt=$_SESSION['interessi'];
        $Nint = count($interesse);
        for($i=0; $i < $Nint; $i++)
        {
        	$messaggio .= $arrayInt[$interesse[$i]] . "<br>";
        }
        
        $messaggio.='</td></tr></table>';
        
        $messaggio.='<br><a href="'. $site_base . 'sendletter/insert_mailing.php?nome='.$nome.'&mail='.$mail.'&interessi=';
        //add interests to the link for later processing
        for($i=0;$i<count($interesse);$i++){
          $messaggio.=$interesse[$i].'~';
        }
        $messaggio[strlen($messaggio)-1]="";
        $messaggio.='" target="_blank">Accetta l\'iscrizione</a>';
        
        $messaggio_to_subscriber="Hai appena inviato l'iscrizione alla newslwetter di http://www.holisticremedies.it/  \n";
        
        $intestazioni  = "MIME-Version: 1.0\r\n";
        $intestazioni .= "Content-type: text/html; charset=utf-8\r\n";
        $intestazioni .= "From: ".$nome." <".$mail.">\r\n";
        //validate emails first
        if(!Swift_Validate::email($mail)){ //validate email, log error
        	echo '<script language="javascript">
        		  	alert(\'email non corretta\');
        	      </script>';
        }elseif (!mail($mail,'Richiesta di adesione',$messaggio_to_subscriber, $intestazioni)){
        	echo '<script language="javascript">
        	alert(\'email non corretta\');
        	</script>';
        }elseif(mail($mail_webmaster,'Richiesta di adesione',$messaggio, $intestazioni)){  
          echo '<script language="javascript">
                alert(\'La tua richiesta e stata inviata ai responsabili.\');
                </script>';
        }else{
        	echo '<script language="javascript">
                alert(\'problema, mail non inviata al responsabile iscrizioni. Contatta info@caisse.it\');
                </script>';
        }
      }     
      
      
      echo '<form name="invia" method="post" action="iscrizione.php">
            <input type="hidden" name="invia" value="1">
            <table width="500" border="0"><tr>
            <td class=footer>Nome e Cognome</td><td><input type="text" name="nome" size="30"></td></tr><tr>
            <td class=footer>E-mail</td><td><input type="text" name="mail" size="30"></td></tr><tr>
       <!--     <td valign="top">Sono interessato a:</td> --><td>';
     //  $result=mysql_query("select * from interessi where id>1 order by nome");
     //  $arrayInteressi =array();
     //  while($riga=mysql_fetch_array($result)){
     // 	$arrayInteressi[$riga['id']]= $riga['nome'];
     //  	echo '<input type="checkbox" name="interessi[]" value="'.$riga['id'].'"> '.$riga['nome'].'<br>';
     //  }
      
     //  $_SESSION['interessi'] = $arrayInteressi;
      echo '</td></tr><tr>
                  <td colspan="2" align="right">
                  <input type=\'submit\' name=\'submit\' value=\'Invia\'></td></tr></table>'
                  //<a href="javascript:void(0);" onclick="document.forms.invia.submit();">Invia</a></table>';   
?>
<p>
</center>
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
