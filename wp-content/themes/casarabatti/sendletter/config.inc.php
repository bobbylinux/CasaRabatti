<?php
require_once('../wp-config.php');
$db_host = DB_HOST;
$db_user = DB_USER;
$db_password = DB_PASSWORD;
$db_name = DB_NAME;

//parametri per email
$mail_mail = "newsletter@casarabatti.it";
$mail_mail = "newsletter@casarabatti.it";
$mail_name = "Casa Rabatti 1823";
$mail_webmaster = "newsletter@casarabatti.it";
$bounce_email = "newsletter@casarabatti.it";
$message_base ="CASA RABATTI 1823<br />Via San Zanobi 48<br />TEL +39 338.1534159<br />MAIL: <a style='color: white' href='mailto:info@casarabatti.it'>INFO@CASARABATTI.IT</a><br /> WEB: <a style='color: white' href='http://www.casarabatti.it' target='_blank'>WWW.CASARABATTI.IT</a>\n";
$image_testatamail = "http://www.casarabatti.it/wp-content/themes/casarabatti/sendletter/testataMAIL.jpg";

//password per inserimento mail
$password = "";

//server smtp
$smtphost = "bulkmailer.mclink.it";

//indirizzo sito
$site_base = "http://www.casarabatti.it/";
$dir_base = "/";
$dir_base_noSlash = "";

$unsuscribeAddress = "http://www.casarabatti.it/sendletter/unsubscribe.php";

?>