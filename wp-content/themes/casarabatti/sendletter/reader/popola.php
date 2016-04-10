<?php
session_start();
//fine funzione di scrittura numeri
require_once "config.inc.php";
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/principale.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>HOLISTIC REMEDIES</title>
<!-- InstanceEndEditable -->
<link href="../../generale.css" rel="stylesheet" type="text/css" />
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</head>

<body bgcolor="#62643f" topmargin="0">
<div id="wrapper">
<div id="header"><img src="../../Grafica/JPG/testata.jpg" width="1100" height="108" /></div>
<div id="subheader1">
<table width="100%">
  <tr>
    <td width="3%"><img src="../../Grafica/ghost.gif" width="76" height="170" /></td>
    <td width="95%">&nbsp;</td>
    <td width="2%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><img src="../../Grafica/JPG/sommario.jpg" width="190" height="140" border="0" usemap="#Map" /></td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>


<div id="subheader2">
  <table width="100%" border="0" cellspacing="0" cellpadding="3">
    <tr>
      <td width="7%"><img src="../../Grafica/ghost.gif" width="76" height="14" /></td>
      <td width="5%" valign="top"><a href="../../ENG/Defaulteng.htm"><img src="../../Grafica/JPG/eng.jpg" width="44" height="33" border="0" /></a></td>
      <td width="29%"><img src="../../Grafica/ghost.gif" width="312" height="8" /></td>
      <td width="59%"><p><img src="../../Grafica/JPG/hel.jpg" width="173" height="54" /></p>        </td>
    </tr>
  </table>
</div>
<!-- InstanceBeginEditable name="Contenuti" -->
<div id="contenuti">
<center>
<?php
    session_start();
    ob_start();
?>
<?php

    if(isset($_POST['login'])){
        if($_POST['user']=="holistic" && $_POST['psw']=="remedies"){
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
<p>
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
  <area shape="rect" coords="1,31,59,50" href="../../Default.htm" />
<area shape="rect" coords="2,57,157,77" href="../../ITA/consigli.htm" />
<area shape="rect" coords="3,80,103,102" href="../../ITA/formula.htm" />
<area shape="rect" coords="1,108,63,128" href="../../holisticecommerce/index.php" />
</map></body>
<!-- InstanceEnd --></html>
