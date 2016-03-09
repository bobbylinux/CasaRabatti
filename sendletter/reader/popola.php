<?php
session_start();
//fine funzione di scrittura numeri
require_once "config.inc.php";
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="../../../Templates/sendletter.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<?php 
require_once('../dbconfig.php');
?>
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
<link href="../../../nuovosito.css" rel="stylesheet" type="text/css" />
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
<div id="news">
<?php
  $link=($GLOBALS["___mysqli_ston"] = mysqli_connect(DBHOST, DBUSER, DBPASS));
((bool)mysqli_query($link, "USE " . constant('DBNAME')));
	$result=mysqli_query($GLOBALS["___mysqli_ston"], "select * from news where id_ins='N' order by data desc");
	
	do{
  $riga=mysqli_fetch_array($result);
  
  if($riga){
	$data=explode("-",$riga[1]);
	
	echo '<table class=tablenews border="0" width="100%">
        <tr><td align="left" class=datanews valign="top"><b>'.$data[2]."-".$data[1]."-".$data[0].'</b></td></tr><tr><td align="left" class=titolonews><b>'.$riga[2].'</b></td></tr><tr><td class=testonews>';
        $i=0;
        $limite=100;
        if(strlen($riga[3])>$limite){
          for($i=0;$i<$limite;$i++){
            echo $riga[3][$i];
          }
          while($riga[3][$i]!=" "){
            echo $riga[3][$i];
            $i++;
          }
          echo '... <a class=link2 href="../../leggi.php?id='.$riga[0].'">Continua</a><br>';
        }
        else{
          echo $riga[3];
        }
        
        echo '</td></tr></table><br>';
  }
}while($riga);
	?> 






</div>
<!-- InstanceBeginEditable name="Contenuti" -->
<div id="contenuti">
<?php
    session_start();
    ob_start();
?>
<?php

    if(isset($_POST['login'])){
        if($_POST['user']=="CAM" && $_POST['psw']=="PeLaTi.2014"){
            $_SESSION['super_user_porza']=1;
        }
    }

    if(!isset($_SESSION['super_user_porza'])){ //ask for login and password
        echo '<form method="post" action="popola.php">
                <input type="hidden" name="login" value="1">
                <input type="text" name="user"><br>
                <input type="password" name="psw"><br>
                <input type="submit" value="Accedi!">
              </form>';
    }
    else{ //if login and password is given
        require_once 'reader.php';
        require_once 'funzioni.php';
        echo '<form method="post" action="popola.php" enctype="multipart/form-data">
                <input type="file" name="miofile"><br>
                '.retrieve_associazioni().'<br>
                <input type="submit" value="Invia!">
            </form>';
        if(isset($_FILES['miofile'])){
            $percorso = $_FILES['miofile']['tmp_name'];
            $nome = $_FILES['miofile']['name'];
            $nome = str_replace(" ","_",$nome);
            if(!move_uploaded_file($percorso, $nome)){
                echo 'Qualcosa non ha funzionato nel caricare il file...' . $percorso ." " . $nome;
            }
            else{         // Popola!
                $risultato=popola($nome,$_POST['id_associazione']);
                if($risultato!=false){
                    echo $risultato;
                }
                else{
                    echo "Qualcosa &egrave; andato storto durante il popolamento";
                }
                unlink($nome);
            }
        }
    }
?>

</div>
<!-- InstanceEndEditable -->
<!-- <div id="banner">
  <?php
  $link=($GLOBALS["___mysqli_ston"] = mysqli_connect(DBHOST, DBUSER, DBPASS));
((bool)mysqli_query($link, "USE " . constant('DBNAME')));
	$result=mysqli_query($GLOBALS["___mysqli_ston"], "select * from banner where pagina='0' order by posizione");
	$riga=mysqli_fetch_array($result);
	echo '<table border="1" width="100%" align="center"><tr><td class=banner><b>Non solo Banner<br>link consigliati</b></td></tr></table>';
while($riga){	
	echo '<table border="0" width="100%" align="center" cellspacing="5">
		<tr><td class=banner><a href="'.$riga['web'].'" target="_blank"><img border="0" src="../../BANNER/'.$riga['img'].'"></a>
		<br><span class=somsezioni>'.$riga[titolo].'</td></tr>';
	  $riga=mysqli_fetch_array($result);	
}
echo '</table>';
	?>
  </div> -->
<div id="footer">
  CAM - Centro Attivit&agrave; musicali - <strong>Firenze - via Monsignor Leto Casini 11</strong> - Tel. 055676064&nbsp; - E-mail: <a class="link" href="mailto: info@camfirenze.net">info@camfirenze.net</a>
  </div>



</div>

</body>
<!-- InstanceEnd --></html>
