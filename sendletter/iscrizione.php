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
<td valign="top">
Se siete interessati a ricevere informazioni dal CAM iscrivetevi alla nostra mailing list.</p>
<?php
      $db = ($GLOBALS["___mysqli_ston"] = mysqli_connect($db_host,  $db_user,  $db_password));
      if ($db == FALSE) {
        die("Errore nella connessione. Verificare i parametri nel file config.inc.php");
      }
      ((bool)mysqli_query( $db, "USE $db_name")) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
      
      if($_POST['invia']==1){
        $nome=$_POST['nome'];
        $mail=$_POST['mail'];
        $mail=trim($mail, " \t\n\r\0\x0B,;");
        $interesse = $_POST['interessi'];
        
        //log new address
        $log_add = new log();
        $log_add->log_address($mail);
        
        //Send message to administrator
        $messaggio='<table border="0"><tr>
            <td>Nome e Cognome</td><td>'.$nome.'</td></tr><tr>
            <td>E-mail</td><td>'.$mail.'</td></tr><tr>
            <td valign="top">&Egrave; interessato a:</td><td>';
        //add interessi to the mail
        $arrayInt=$_SESSION['interessi'];
        //echo $arrayInt[2];
        $Nint = count($interesse);
        for($i=0; $i < $Nint; $i++)
        {
          $messaggio .= $arrayInt[$interesse[$i]] . "<br>";
          //echo $i." ".$interesse[$i].$arrayInt[$interesse[$i]];
        }
        
        $messaggio.='</td></tr></table>';
        
        $messaggio.='<br><a href="'. $site_base . 'sendletter/insert_mailing.php?nome='.$nome.'&mail='.$mail.'&interessi=';
        //add interests to the link for later processing
        for($i=0;$i<count($interesse);$i++){
          $messaggio.=$interesse[$i].'~';
        }
        $messaggio[strlen($messaggio)-1]="";
        $messaggio.='" target="_blank">Accetta l\'iscrizione</a>';
        
        $messaggio_to_subscriber="Hai appena inviato l'iscrizione alla newslwetter di http://www.camfirenze.net/  \n";
        
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
        }elseif(mail($mail_webmaster,'Richiesta di iscrizione alla NEWSLETTER',$messaggio, $intestazioni)){  
          echo '<script language="javascript">
                alert(\'La tua richiesta e stata inviata ai responsabili.\');
                </script>';
        }else{
          echo '<script language="javascript">
                alert(\'problema, mail non inviata al responsabile iscrizioni. Contatta info@camfirenze.net\');
                </script>';
        }
      }     
      
      
      echo '<form name="invia" method="post" action="iscrizione.php">
            <input type="hidden" name="invia" value="1">
            <table width="500" border="0"><tr>
            <td>Nome e Cognome</td><td><input type="text" name="nome" size="30"></td></tr><tr>
            <td>E-mail</td><td><input type="text" name="mail" size="30"></td></tr><tr>
            <td valign="top">Sono interessato a:</td><td>';
       $result=mysqli_query($GLOBALS["___mysqli_ston"], "select * from interessi where id>1 order by nome");
       $arrayInteressi =array();
       while($riga=mysqli_fetch_array($result)){
        $arrayInteressi[$riga['id']]= $riga['nome'];
        echo '<input type="checkbox" name="interessi[]" value="'.$riga['id'].'"> '.$riga['nome'].'<br>';
       }
      
       $_SESSION['interessi'] = $arrayInteressi;
       
      echo '</td></tr><tr>
                  <td colspan="2" align="right">
                  <input type=\'submit\' name=\'submit\' value=\'Invia\'></td></tr></table><p>'
                  //<a href="javascript:void(0);" onclick="document.forms.invia.submit();">Invia</a></table>';   

?>

</div>
<!-- InstanceEndEditable -->

<div id="footer">
  CAM - Centro Attivit&agrave; musicali - <strong>Firenze - via Monsignor Leto Casini 11</strong> - Tel. 055676064&nbsp; - E-mail: <a class="link" href="mailto: info@camfirenze.net">info@camfirenze.net</a>
  </div>



</div>

</body>
<!-- InstanceEnd --></html>
