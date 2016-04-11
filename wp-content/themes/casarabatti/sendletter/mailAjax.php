<?php
require_once('../../../../wp-config.php');
$db_host = DB_HOST;
$db_user = DB_USER;
$db_password = DB_PASSWORD;
$db_name = DB_NAME;
require_once "config.inc.php";
include "swiftmailer-5.x/lib/swift_required.php";
include "log.php";

$real = true;
$transport = Swift_MailTransport::newInstance();
//$transport = Swift_SendmailTransport::newInstance('/usr/sbin/sendmail -bs');
$mailer = Swift_Mailer::newInstance($transport);
$mailer->registerPlugin(new Swift_Plugins_ThrottlerPlugin(
    100, Swift_Plugins_ThrottlerPlugin::MESSAGES_PER_MINUTE
));
// crea la lista destinatari
$db = mysqli_connect($db_host, $db_user, $db_password);
if ($db == FALSE) {
    echo json_encode("Errore nella connessione al database");
    die;
}

mysqli_select_db($db,$db_name) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
$query_prova = "SELECT count(1) as prova FROM mail WHERE associazione = -1 AND inviare = 1;";
$result_prova = mysqli_query($db,$query_prova);
//Repeat for each email to send
while ($row_prova = mysqli_fetch_assoc($result_prova)) {
    $count = $row_prova['prova'];
}

if ($count > 0) {
    $real = false;
}


// recupero i dati inviati
if ($real) {
    $query_mail = "SELECT id,oggetto,messaggio,associazione,data FROM mail WHERE inviare = 1 AND associazione <> -1";
} else {

    $query_mail = "SELECT id,oggetto,messaggio,associazione,data FROM mail WHERE inviare = 1 AND associazione = -1";
}
// se il form  stato inviato
// recupero i dati inviati
$result_mail = mysqli_query($db,$query_mail);

//Repeat for each email to send
while ($row_mail = mysqli_fetch_assoc($result_mail)) {
    $subject = $row_mail['oggetto'];
    $message = $row_mail['messaggio'];
    $associazione = $row_mail['associazione'];
    $date = $row_mail['data'];
    $id = $row_mail['id'];

    //puts the inviare to 0 so it doesn;t send it many times
    $query = "UPDATE mail SET inviare = '0'  where id = '" . $id . "'";
    $result = mysqli_query($db,$query) or die(mysqli_error($db));

    //prima cancello i log precedenti
    $query = "DELETE FROM tmpmail WHERE 
                                    ora_invio < (SYSDATE() - INTERVAL 1 MONTH);";
    $result = mysqli_query($db,$query) or die(mysqli_error($db));

    $email = $mail_mail; //mi server per il replay to

// 	//calcola l'indirizzo di unsuscribe
// 	$protocol = (strpos(strtolower($_SERVER['SERVER_PROTOCOL']),'https') == FALSE) ? 'http' : 'https';
// 	$host     = $_SERVER['HTTP_HOST'];
// 	$script   = $_SERVER['SCRIPT_NAME'];
// 	$unsuscribe_address = $protocol . "://". $host . $script;
// 	$unsuscribe_address = str_replace('mail.php', 'unsubscribe.php', $unsuscribe_address);


    // crea il BODY del messaggio html
    $msgtxt = "<html><head><meta htp-equiv='Content-Type' content='text/html; charset=utf-8' /></head><body topmargin=0 style='font-size: small; background-color: #FFFFFF;'><img src='" . $image_testatamail . "' /><br />\n";
    $msgtxt .= "Data: {$date}<hr />\n";
    //$msgtxt .= "<p><b>ATTENZIONE: per non ricevere pi&ugrave; questa newsletter fare click <a href='" . $unsuscribeAddress . "'>QUI</a></b></p>";
    $msgtxt .= "{$message}\n";
    $msgtxt .= "<div style='text-align: center; margin: 0 auto; width: 1000px; align: center;'><p>\n";
    $msgtxt .= $message_base;
    $msgtxt .= "</div></body></html>\n";


    //==========mio
    //read all address for association or for interessi from the DB
    if ($associazione == "0") {
        $query = 'SELECT DISTINCT mail, id FROM soci WHERE mail is not null and trim(mail) not in ("") and confermato = 1';
        $result = mysqli_query($db,$query) or die(mysqli_error());
    } else {
        if ($real) {
            $query = 'SELECT DISTINCT mail, soci.id FROM soci, interessi_soci WHERE id_interesse IN (' . $associazione . ') AND soci.id=id_socio AND mail is not null and trim(mail) not in ("") and confermato = 1';
        } else {
            $query = 'SELECT DISTINCT mail, id FROM soci_prova';
        }
        $result = mysqli_query($db,$query) or die(mysqli_error());
    }

    /*
     $query = 'SELECT DISTINCT mail, id FROM soci WHERE soci.id>50000 AND mail is not null and trim(mail) not in ("")' ;
    al posto di
    $query = 'SELECT DISTINCT mail, id FROM soci WHERE mail is not null and trim(mail) not in ("")' ;
    */

    //parto il ciclo di lettura degli indirizzi
    $log_error = new log();

    $log_error->scrivi_invio("\n\n=================================================================\n");

    $log_error->scrivi_invio($subject . "\n\n");
    $log_error->scrivi_errore_invio("\n\n============================================================\n");
    $log_error->scrivi_errore_invio($subject . "\n\n");

    try {
        //instanzio l'oggetto messaggio
        $msg = Swift_Message::newInstance();
        //Give the message a subject
        $msg->setSubject($subject);
        //Set the From address with an associative array
        $msg->setFrom(array($email => $mail_name));
        //set bounce address
        $msg->setReturnPath($bounce_email);
        //set characterset
        $msg->setCharset('utf-8');
        //set content-type
        $msg->setContentType("text/html");
        //Give it a body
        $msg->setBody(stripslashes($msgtxt));
        //set encoder
        $msg->setEncoder(Swift_Encoding::get7BitEncoding());

        $search = array(';', ',,', ',');
        $replace = array('', '', '');

        $msgok = 0;
        while ($row = mysqli_fetch_assoc($result)) { //per ogni riga sul db
            if ($row['mail'] != '') {
                $destinatari_raw = $row['mail'];
                //prendo l'id utente
                $id_utente = $row['id'];
                //pulitura indirizzi sostituisco gli spazi e i ";" con le ","
                //$destinatari = str_replace($search, $replace, $destinatari_raw);
                $destinatari = trim($destinatari_raw);
                //https://github.com/swiftmailer/swiftmailer/blob/master/lib/classes/Swift/Validate.php

                if (!Swift_Validate::email($destinatari)) { //validate email
                    //do something, skip them
                    $log_error->scrivi_errore_invio($destinatari);
                    continue;
                }
                $msg->setTo(array($destinatari));
                //invio del messaggio
                try {
                    $ret = $mailer->send($msg);

                    if ($ret > 0) {
                        //log email correttamente inviata esito = true
                        $qry_log_mail = 'INSERT INTO tmpmail(id,indirizzo,id_utente,ora_invio,oggetto_mail,esito)
	    				VALUES (NULL,"' . $destinatari . '",' . $id_utente . ',NULL,"' . $subject . '",true)';
                        $result_log_mail_ok = mysqli_query($db,$qry_log_mail);
                        $msgok++;
                        $log_error->scrivi_invio($id_utente . ' - ' . $destinatari);
                    } else {
                        //log email errata esito = false
                        $qry_log_mail = 'INSERT INTO tmpmail(id,indirizzo,id_utente,ora_invio,oggetto_mail,esito)
	    				VALUES (NULL,"' . $destinatari . '",' . $id_utente . ',NULL,"' . $subject . '",false)';
                        $result_log_mail_failed = mysqli_query($db,$qry_log_mail);
                        $log_error->scrivi_errore_invio($id_utente . ' - ' . $destinatari);
                    }

                    if ($msgok % 300 == 0) {//to change back to 1000
                        $query2 = "UPDATE mail SET inviate = '$msgok' where id = '" . $id . "'";
                        mysqli_query($db,$query2);
                    }
                } catch (Exception $e) {
                    $log_error->scrivi_errori($e->getMessage() . ';');
                }
            }
        }
    } catch (Exception $e) {
        //loggo il mancanto invio
        $log_error->$erroreinviolog($e->getMessage() . ';');
    }

    $query = "UPDATE mail SET inviate = '$msgok' where id = '" . $id . "'";
    $result = mysqli_query($db,$query);
    //$log_error->close();
}

$response = array(
    "msg" => "done"
);
echo json_encode($response);


?>
