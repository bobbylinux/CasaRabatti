<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
    <head>
        <title>openWYSIWYG | Insert Image</title>
        <script language="JavaScript" type="text/javascript">

            var qsParm = new Array();


            /* ---------------------------------------------------------------------- *\
      Function    : retrieveWYSIWYG()
      Description : Retrieves the textarea ID for which the image will be inserted into.
    \* ---------------------------------------------------------------------- */
            function retrieveWYSIWYG() {
                var query = window.location.search.substring(1);
                var parms = query.split('&');
                for (var i=0; i<parms.length; i++) {
                    var pos = parms[i].indexOf('=');
                    if (pos > 0) {
                        var key = parms[i].substring(0,pos);
                        var val = parms[i].substring(pos+1);
                        qsParm[key] = val;
                    }
                }
            }


            /* ---------------------------------------------------------------------- *\
      Function    : insertImage()
      Description : Inserts image into the WYSIWYG.
    \* ---------------------------------------------------------------------- */
            function insertImage() {
                var image = '<img src="' + document.getElementById('imageurl').value + '" alt="' + document.getElementById('alt').value + '" alignment="' + document.getElementById('alignment').value + '" border="' + document.getElementById('borderThickness').value + '" hspace="' + document.getElementById('horizontal').value + '" vspace="' + document.getElementById('vertical').value + '">';
                window.opener.insertHTML(image, qsParm['wysiwyg']);
                window.close();
            }

        </script>
    </head>
    <body bgcolor="#EEEEEE" onLoad="retrieveWYSIWYG();">
        <?php
        include("../../config.inc.php");
       
# Using HTTP_HOST
        if (isset($_POST['uploadfile'])) {
            //$dir = 'benci/sendletter/wysiwyg/tmpimg';
            $dir = $dir_base_noSlash . 'sendletter/wysiwyg/tmpimg';
            $dirmake = '../tmpimg';
            //si assicura che il caricamento sia avvenuto correttamente
            if ($_FILES['uploadfile']['error'] != UPLOAD_ERR_OK) {
                switch ($_FILES['uploadfile']['error']) {
                    case UPLOAD_ERR_INI_SIZE:
                    case UPLOAD_ERR_FORM_SIZE:
                        die('il file &grave troppo grande per le dimensioni massime consentite');
                        break;
                    case UPLOAD_ERR_PARTIAL:
                        die('il file &egrave stato caricato solo parzialmente');
                        break;
                    case UPLOAD_ERR_NO_FILE:
                        die('il file non &egrave stato caricato');
                        break;
                    case UPLOAD_ERR_CANT_WRITE:
                        die('il server ha impedito la scrittura del file');
                        break;
                    case UPLOAD_ERR_EXTENSION:
                        die('il file non &egrave in un formato supportato');
                        break;
                }
            }
            //recupera le informazioni sull'immagine appena caricata
            list($width, $heigth, $type, $attr) = getimagesize($_FILES['uploadfile']['tmp_name']);
            $filename = $_FILES['uploadfile']['tmp_name'];
            switch ($type) {
                case IMAGETYPE_GIF:
                    $image = imagecreatefromgif($filename) or
                            die('il file caricato non &egrave supportato');
                    $ext = '.gif';
                    break;
                case IMAGETYPE_JPEG:
                    $image = imagecreatefromjpeg($filename) or
                            die('il file caricato non &egrave supportato');
                    $ext = '.jpg';
                    break;
                case IMAGETYPE_PNG:
                    $image = imagecreatefrompng($filename) or
                            die('il file caricato non &egrave supportato');
                    $ext = '.png';
                    break;
                default :
                    die('il file caricato non &egrave supportato');
            }

            $db = mysql_connect($db_host, $db_user, $db_password);
            if ($db == FALSE) {
                die("Errore nella connessione. Verificare i parametri nel file config.inc.php");
            }
            mysql_select_db($db_name, $db) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
            $query = 'INSERT INTO tmpimg(nome) values ("' . $_FILES['uploadfile']['name'] . '")';
            $result = mysql_query($query, $db) or die(mysql_error($db));
            //prendo l'id appena inserito.
            $content = mysql_insert_id();
            $filename = 'img' . $content;

            $filename .= $ext;

            //salva l'immagine nella cartella tmpimg
            switch ($type) {
                case IMAGETYPE_GIF:
                    $ret = imagegif($image, $dirmake . '/' . $filename);
                    break;
                case IMAGETYPE_JPEG:
                    $ret = imagejpeg($image, $dirmake . '/' . $filename);
                    break;
                case IMAGETYPE_PNG:
                    $ret = imagepng($image, $dirmake . '/' . $filename);
                    break;
            }
            imagedestroy($image);
            //marginwidth="0" marginheight="0" topmargin="0" leftmargin="0"
            ?>


            <table border="0" cellpadding="0" cellspacing="0" style="padding: 10px;"><tr><td>

                        <span style="font-family: arial, verdana, helvetica; font-size: 11px; font-weight: bold;">Inserisci Immagine Nel Documento:</span>
                        <table width="380" border="0" cellpadding="0" cellspacing="0" style="background-color: #F7F7F7; border: 2px solid #FFFFFF; padding: 5px;">		  			
                            <tr>
                                <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;">Titolo:</td>
                                <td style="padding-bottom: 2px; padding-top: 0px;"><input type="text" name="alt" id="alt" value="<?php echo $_POST['alt']; ?>"  style="font-size: 10px; width: 100%;"></td>
                            </tr>
                        </table>



                        <table width="380" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;"><tr><td>

                                    <span style="font-family: arial, verdana, helvetica; font-size: 11px; font-weight: bold;">Layout:</span>
                                    <input type="hidden" name="imageurl" id="imageurl" value="<?php echo 'http://' . $_SERVER['HTTP_HOST'] . '/' . $dir . '/' . $filename ?>"  style="font-size: 10px; width: 100%;">
                                    <table width="185" border="0" cellpadding="0" cellspacing="0" style="background-color: #F7F7F7; border: 2px solid #FFFFFF; padding: 5px;">
                                        <tr>
                                            <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;" width="100">Allineamento:</td>
                                            <td style="padding-bottom: 2px; padding-top: 0px;" width="85">
                                                <select name="alignment" id="alignment" style="font-family: arial, verdana, helvetica; font-size: 11px; width: 100%;">
                                                    <option value="<?php echo $_POST['alignment']; ?>"><?php echo $_POST['alignment']; ?></option>
                                                    <option value="">Non Impostato</option>
                                                    <option value="left">Sinistra</option>
                                                    <option value="right">Destra</option>
                                                    <option value="texttop">Sopra Il Testo</option>
                                                    <option value="absmiddle">Centro Assoluto</option>
                                                    <option value="baseline">Alla Base</option>
                                                    <option value="absbottom">Fondo Assoluto</option>
                                                    <option value="bottom">Bottom</option>
                                                    <option value="middle">Met&agrave;</option>
                                                    <option value="top">Top</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;">Spessore Bordo:</td>
                                            <td style="padding-bottom: 2px; padding-top: 0px;"><input type="text" name="borderThickness" id="borderThickness" value="<?php echo $_POST['borderThickness']; ?>"  style="font-size: 10px; width: 100%;"></td>
                                        </tr>
                                    </table>	

                                </td>
                                <td width="10">&nbsp;</td>
                                <td>

                                    <span style="font-family: arial, verdana, helvetica; font-size: 11px; font-weight: bold;">Spacing:</span>
                                    <table width="185" border="0" cellpadding="0" cellspacing="0" style="background-color: #F7F7F7; border: 2px solid #FFFFFF; padding: 5px;">
                                        <tr>
                                            <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;" width="80">Horizontal:</td>
                                            <td style="padding-bottom: 2px; padding-top: 0px;" width="105"><input type="text" name="horizontal" id="horizontal" value="<?php echo $_POST['horizontal']; ?>"  style="font-size: 10px; width: 100%;"></td>
                                        </tr>
                                        <tr>
                                            <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;">Vertical:</td>
                                            <td style="padding-bottom: 2px; padding-top: 0px;"><input type="text" name="vertical" id="vertical" value="<?php echo $_POST['vertical']; ?>"  style="font-size: 10px; width: 100%;"></td>
                                        </tr>
                                    </table>	

                                </td></tr></table>

                        <div align="right" style="padding-top: 5px;"><input type="submit" value="Inserisci" onClick="insertImage();" style="font-size: 12px;" >&nbsp;<input type="submit" value="Annulla" onClick="window.close();" style="font-size: 12px;" ></div>

                </tr></table>
            <?php
        } else { //marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" 
            ?>
            <table border="0" cellpadding="0" cellspacing="0" style="padding: 10px;"><tr><td>
                        <span style="font-family: arial, verdana, helvetica; font-size: 11px; font-weight: bold;">Carica Immagine Sul Server:</span>
                        <form action="insert_image.php?wysiwyg=7" method="post" enctype="multipart/form-data">
                            <table width="380" border="0" cellpadding="0" cellspacing="0" style="background-color: #F7F7F7; border: 2px solid #FFFFFF; padding: 5px;">
                                <tr>
                                    <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;" width="80">URL:</td>
                                    <td style="padding-bottom: 2px; padding-top: 0px;" width="300">
                                        <input name="uploadfile" type="file" id="src" /></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;">Titolo:</td>
                                    <td style="padding-bottom: 2px; padding-top: 0px;"><input type="text" name="alt" id="alt" value=""  style="font-size: 10px; width: 100%;"></td>
                                </tr>
                            </table>	
                            <table width="380" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;"><tr><td>
                                        <span style="font-family: arial, verdana, helvetica; font-size: 11px; font-weight: bold;">Layout:</span>
                                        <table width="185" border="0" cellpadding="0" cellspacing="0" style="background-color: #F7F7F7; border: 2px solid #FFFFFF; padding: 5px;">
                                            <tr>
                                                <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;" width="100">Alignment:</td>
                                                <td style="padding-bottom: 2px; padding-top: 0px;" width="85">
                                                    <select name="alignment" id="alignment" style="font-family: arial, verdana, helvetica; font-size: 11px; width: 100%;">
                                                        <option value="">Non Impostato</option>
                                                        <option value="left">Sinistra</option>
                                                        <option value="right">Destra</option>
                                                        <option value="texttop">Sopra Il Testo</option>
                                                        <option value="absmiddle">Centro Assoluto</option>
                                                        <option value="baseline">Alla Base</option>
                                                        <option value="absbottom">Fondo Assoluto</option>
                                                        <option value="bottom">Bottom</option>
                                                        <option value="middle">Met&agrave;</option>
                                                        <option value="top">Top</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;">Spessore Bordo:</td>
                                                <td style="padding-bottom: 2px; padding-top: 0px;"><input type="text" name="borderThickness" id="borderThickness" value=""  style="font-size: 10px; width: 100%;"></td>
                                            </tr>
                                        </table>	

                                    </td>
                                    <td width="10">&nbsp;</td>
                                    <td>

                                        <span style="font-family: arial, verdana, helvetica; font-size: 11px; font-weight: bold;">Spacing:</span>
                                        <table width="185" border="0" cellpadding="0" cellspacing="0" style="background-color: #F7F7F7; border: 2px solid #FFFFFF; padding: 5px;">
                                            <tr>
                                                <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;" width="80">Horizontal:</td>
                                                <td style="padding-bottom: 2px; padding-top: 0px;" width="105"><input type="text" name="horizontal" id="horizontal" value=""  style="font-size: 10px; width: 100%;"></td>
                                            </tr>
                                            <tr>
                                                <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;">Vertical:</td>
                                                <td style="padding-bottom: 2px; padding-top: 0px;"><input type="text" name="vertical" id="vertical" value=""  style="font-size: 10px; width: 100%;"></td>
                                            </tr>
                                        </table>	

                                    </td></tr></table>

                            <div align="right" style="padding-top: 5px;"><input type="submit" name="uploadfile" value="Carica"  style="font-size: 12px;" >&nbsp;<input type="submit" value="Cancel" onClick="window.close();" style="font-size: 12px;" ></div>
                        </form>
                </tr></table>
        <?php } ?>
    </body>
</html>
