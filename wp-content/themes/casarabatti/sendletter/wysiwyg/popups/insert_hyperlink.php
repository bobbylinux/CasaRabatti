<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
    <head>
        <title>openWYSIWYG | Select Color</title>
    </head>
    <script language="JavaScript" type="text/javascript">

        var qsParm = new Array();


        /* ---------------------------------------------------------------------- *\
      Function    : retrieveWYSIWYG()
      Description : Retrieves the textarea ID for which the link will be inserted into.
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


        function insertHyperLink() {
            var hyperLink = document.getElementById('linkType').value + document.getElementById('url').value;
            window.opener.document.getElementById('wysiwyg' + qsParm['wysiwyg']).contentWindow.document.execCommand("CreateLink", false, hyperLink);
            window.close();
        }

    </script>
    <body bgcolor="#EEEEEE" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="retrieveWYSIWYG();">
        <?php
        if (isset($_POST['uploadfile'])) {
            //carico il pdf nella directory temp
            include("../../config.inc.php");
            $dir = $dir_base_noSlash. 'sendletter/wysiwyg/tmpdoc';
            $dirmake = 'tmpdoc';
            if ($_FILES['file']['error'] != UPLOAD_ERR_OK) {
                switch ($_FILES['file']['error']) {
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
            $filename = $_FILES['file']['name'];
            $ext = substr(trim($_FILES['file']['name']),strrpos($_FILES['file']['name'],'.'));
            
            $db = mysql_connect($db_host, $db_user, $db_password);
            if ($db == FALSE) {
                die("Errore nella connessione. Verificare i parametri nel file config.inc.php");
            }
            mysql_select_db($db_name, $db) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
            $query = 'INSERT IGNORE INTO tmpdoc(nome) values ("' . $_FILES['file']['name'] . '")';
            $result = mysql_query($query, $db) or die(mysql_error($db));
            //prendo l'id appena inserito.
            $content = mysql_insert_id();
            $filename = 'doc' . $content;

            $filename .= $ext;
            //salva il file nella cartella tmpdoc
            $tmpname = $_FILES['file']['tmp_name'];
            $return_muf = move_uploaded_file($tmpname,$dirmake.'/'.$filename);
            $absoluteurl =  $_SERVER['HTTP_HOST'] . '/' . $dir .'/'.$filename;
            ?>
            <table border="0" cellpadding="0" cellspacing="0" style="padding: 10px;"><tr><td>

                        <span style="font-family: arial, verdana, helvetica; font-size: 11px; font-weight: bold;">Insert Hyperlink:</span>
                        <table width="280" border="0" cellpadding="0" cellspacing="0" style="background-color: #F7F7F7; border: 2px solid #FFFFFF; padding: 5px;">
                            <input type="hidden" name="linkType" value="<?php echo $_POST['linkType']?>" id="linkType" />
                            <tr>
                                <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;">URL:</td>
                                <td style="padding-bottom: 2px; padding-top: 0px;"><input type="text" name="url" id="url" value="<?php echo $absoluteurl;?>"  style="font-size: 10px; width: 100%;"></td>
                            </tr>
                        </table>	

                        <div align="right" style="padding-top: 5px;"><input type="submit" value="  Inserisci  " onClick="insertHyperLink();" style="font-size: 12px;" >&nbsp;<input type="submit" value="  Cancel  " onClick="window.close();" style="font-size: 12px;" ></div>

                </tr></td></table>
    <?php } else { ?> 
        <form name="submit" action="insert_hyperlink.php?wysiwyg=7" method="POST" enctype="multipart/form-data">
            <table border="0" cellpadding="0" cellspacing="0" style="padding: 10px;"><tr><td>

                        <span style="font-family: arial, verdana, helvetica; font-size: 11px; font-weight: bold;">Insert Hyperlink:</span>
                        <table width="280" border="0" cellpadding="0" cellspacing="0" style="background-color: #F7F7F7; border: 2px solid #FFFFFF; padding: 5px;">
                            <tr>
                                <td style="padding-bottom: 2px; width: 50px; font-family: arial, verdana, helvetica; font-size: 11px;">Type:</td>
                                <td style="padding-bottom: 2px;">
                                    <select name="linkType" id="linkType" style="margin-right: 10px; font-size: 10px;">
                                        <option value="http://">http:</option>
                                        <option value="https://">https:</option>
                                        <option value="mailto:">mailto:</option>
                                    </select>
                                </td>	
                            </tr>
                            <tr>
                                <td style="padding-bottom: 2px; padding-top: 0px; font-family: arial, verdana, helvetica; font-size: 11px;">URL:</td>
                                <td style="padding-bottom: 2px; padding-top: 0px;">
                                    <input type="file" name="file" id="url" value=""  style="font-size: 10px; width: 100%;"></td>
                            </tr>
                        </table>	

                        <div align="right" style="padding-top: 5px;"><input type="submit" name ="uploadfile" value="  Carica  " onClick="" style="font-size: 12px;" >&nbsp;<input type="submit" value="  Cancel  " onClick="window.close();" style="font-size: 12px;" ></div>

                </tr></td></table>
        </form>
    <?php } ?>
</body>
</html>
