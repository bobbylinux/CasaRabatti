<?php
chdir(dirname(__FILE__));
//echo dirname(__FILE__);
require_once "config.inc.php";
include "swift/lib/swift_required.php";
include "log.php";



//new one
	//devo allungare il tempo limite di script
	//creo il transport
	$transport = Swift_MailTransport::newInstance();
	$mailer = Swift_Mailer::newInstance($transport);
	//Use AntiFlood to re-connect after 100 emails
	//$mailer->registerPlugin(new Swift_Plugins_AntiFloodPlugin(100,30));
	//Rate limit to 100 emails per-minute
	$mailer->registerPlugin(new Swift_Plugins_ThrottlerPlugin(
	100, Swift_Plugins_ThrottlerPlugin::MESSAGES_PER_MINUTE
	));
	// crea la lista destinatari
	$db = mysql_connect($db_host, $db_user, $db_password);
	if ($db == FALSE) {
		die("Errore nella connessione. Verificare i parametri nel file config.inc.php");
	}
	mysql_select_db($db_name, $db) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");


// recupero i dati inviati
$query_mail = "SELECT id,oggetto,messaggio,associazione,data FROM mail WHERE inviare = 1";
// se il form  stato inviato
// recupero i dati inviati
$result_mail = mysql_query($query_mail, $db);

//Repeat for each email to send
while ($row_mail = mysql_fetch_assoc($result_mail)) {
    $subject = $row_mail['oggetto'];
    $message = $row_mail['messaggio'];
    $associazione = $row_mail['associazione'];
    $date = $row_mail['data'];
    $id = $row_mail['id'];
    
    //puts the inviare to 0 so it doesn;t send it many times
    $query="UPDATE mail SET inviare = '0'  where id = '" . $id . "'";
    $result = mysql_query($query,$db) or die(mysql_error($db));
    
    //prima cancello i log precedenti
    $query = "DELETE FROM tmpmail WHERE 
                                    ora_invio < (SYSDATE() - INTERVAL 1 MONTH);";
    $result = mysql_query($query,$db) or die(mysql_error($db));

    $email = $mail_mail; //mi server per il replay to
					
// 	//calcola l'indirizzo di unsuscribe
// 	$protocol = (strpos(strtolower($_SERVER['SERVER_PROTOCOL']),'https') == FALSE) ? 'http' : 'https';
// 	$host     = $_SERVER['HTTP_HOST'];
// 	$script   = $_SERVER['SCRIPT_NAME'];
// 	$unsuscribe_address = $protocol . "://". $host . $script;
// 	$unsuscribe_address = str_replace('mail.php', 'unsubscribe.php', $unsuscribe_address);
	
					
	// crea il BODY del messaggio html
	$msgtxt = "<html><head><meta htp-equiv='Content-Type' content='text/html; charset=utf-8' /></head><body topmargin=0 style='font-size: small; background-color: #FFFFFF;'><img src='" . $image_testatamail ."' /><br />\n";
	$msgtxt .= "Data: {$date}<hr />\n";
	$msgtxt .= "<p><b>ATTENZIONE: per non ricevere pi&ugrave; questa newsletter fare click <a href='". $unsuscribeAddress . "'>QUI</a></b></p>";
	$msgtxt .= "{$message}\n";
	$msgtxt .= "<div style='text-align: center; margin: 0 auto; width: 1000px; color: white; background-color: #62643f; align: center;'><p>\n";
	$msgtxt .= $message_base;
    $msgtxt .= "</div></body></html>\n";   
    
    //==========mio
    //read all address for association or for interessi from the DB
    if($associazione=="0"){
    	$query = 'SELECT DISTINCT mail, id FROM soci WHERE mail is not null and trim(mail) not in ("")' ;
    	//$query = 'SELECT DISTINCT mail, id FROM soci WHERE soci.id>1497 AND  mail is not null and trim(mail) not in ("")' ;
    	$result = mysql_query($query) or die(mysql_error());
    }else{
    	$query = 'SELECT DISTINCT mail, soci.id FROM soci, interessi_soci WHERE id_interesse IN (' . $associazione . ') AND soci.id=id_socio AND mail is not null and trim(mail) not in ("")' ;
    	$result = mysql_query($query) or die(mysql_error());
    }
    
    /*
     $query = 'SELECT DISTINCT mail, id FROM soci WHERE soci.id>50000 AND mail is not null and trim(mail) not in ("")' ;
    al posto di
    $query = 'SELECT DISTINCT mail, id FROM soci WHERE mail is not null and trim(mail) not in ("")' ;
    */

    //parto il ciclo di lettura degli indirizzi
    $log_error = new log();
    $log_error->scrivi_invio("\n\n=================================================================\n");
    $log_error->scrivi_invio( $subject  . "\n\n");
    $log_error->scrivi_errore_invio("\n\n============================================================\n");
    $log_error->scrivi_errore_invio($subject  . "\n\n");
    
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
        
//     	$shortSubject = substr($subject, 0, 15);
//     	if(!$shortSubject){
//     		$shortSubject = $subject;
//     	}
    	
    	$msgok=0;
    	while ($row = mysql_fetch_assoc($result)) { //per ogni riga sul db
    		if ($row['mail'] != '') {
    			$destinatari_raw = $row['mail']; 
    			//prendo l'id utente
    			$id_utente = $row['id'];
    			//pulitura indirizzi sostituisco gli spazi e i ";" con le ","
    			//$destinatari = str_replace($search, $replace, $destinatari_raw);
    			$destinatari = trim($destinatari_raw);
    			//https://github.com/swiftmailer/swiftmailer/blob/master/lib/classes/Swift/Validate.php
    			
    			if(!Swift_Validate::email($destinatari)){ //validate email
    				//do something, skip them
    				$log_error->scrivi_errore_invio($destinatari);
    				continue;
    			}
    			$msg->setTo(array($destinatari));
    			//invio del messaggio
    			try {
	    			$ret = $mailer->send($msg);
	    			
	    			if ($ret>0) {
	    				//log email correttamente inviata esito = true
	    				$qry_log_mail = 'INSERT INTO tmpmail(id,indirizzo,id_utente,ora_invio,oggetto_mail,esito)
	    				VALUES (NULL,"' . $destinatari . '",' . $id_utente . ',NULL,"'. $subject .'",true)';
	    				$result_log_mail_ok= mysql_query($qry_log_mail);
	    				$msgok++;				
	    				$log_error->scrivi_invio($id_utente . ' - ' . $destinatari);
	    			} else {
	    				//log email errata esito = false
	    				$qry_log_mail = 'INSERT INTO tmpmail(id,indirizzo,id_utente,ora_invio,oggetto_mail,esito)
	    				VALUES (NULL,"' . $destinatari . '",' . $id_utente . ',NULL,"'. $subject .'",false)';
	    				$result_log_mail_failed= mysql_query($qry_log_mail);
	    				$log_error->scrivi_errore_invio($id_utente . ' - ' . $destinatari);
	    			}
	    			if($msgok % 300 == 0){//to change back to 1000
	    				$query2="UPDATE mail SET inviate = '$msgok' where id = '" . $id . "'";
	    				mysql_query($query2,$db);
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
    
    $query="UPDATE mail SET inviate = '$msgok' where id = '" . $id . "'";
    $result = mysql_query($query,$db);
    $log_error->close();

}

 
?>
