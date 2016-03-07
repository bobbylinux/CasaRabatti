<?php
//fine funzione di scrittura numeri
require_once "../config.inc.php";
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html
    xmlns="http://www.w3.org/1999/xhtml">
    <!-- InstanceBegin template="/Templates/sito.dwt" codeOutsideHTMLIsLocked="false" -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>WYSIWYG</title>
        <link href="style_wysiwyg.css" rel="stylesheet" type="text/css" />
        <script language="JavaScript" type="text/JavaScript" src="wysiwyg.js"></script>

        <!-- InstanceBeginEditable name="head" -->
        <!-- InstanceEndEditable -->
    </head>
    <body>
        <div id="wrapper">
            <textarea name='message' rows='20' cols='100' id='7'></textarea>
            <script language='JavaScript'>
                generate_wysiwyg('7');
            </script>
        </div>
    </body>
