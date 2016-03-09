<?php

chdir(dirname(__FILE__));
include "../swift/lib/swift_required.php";
include "../log.php";

    // Cerca username e password nelle tabelle anagrafiche;
    // ritorna un array con il tipo di utente e l'id
    function login_user($user, $psw){
        $tabelle=array("amministrazione","anagrafica","associazioni","special_users");
        for($i=0;$i<count($tabelle);$i++){
            $tabella=$tabelle[$i];
            $result=mysqli_query($GLOBALS["___mysqli_ston"], "select * from $tabella where user='$user' and psw='$psw'");
            $riga=mysqli_fetch_array($result);
            if($riga){
                $return_value['id']=$riga['id'];
                switch($tabella){
                    case 'amministrazione':
                        $return_value['tipo']="admin";
                    break;
                    case 'anagrafica':
                        $return_value['tipo']="utente";
                    break;
                    case 'associazioni':
                        $return_value['tipo']="associazione";
                    break;
                    case 'special_users':
                        $return_value['tipo']="esperto";
                    break;
                }
                return $return_value;
            }
        }
        return null;
    }
    

    // Ritorna l'url completo di questa pagina
    function retrieve_url(){
        if ($_SERVER['QUERY_STRING'] <> "") {
            $int = "?";
        }
        else {
            $int = "";
        }
        $url = "http://".$_SERVER['SERVER_NAME'].$_SERVER['PHP_SELF'].$int.$_SERVER['QUERY_STRING'];
        return $url;
    }
    
    
    // FUNZIONE PER LA STAMPA DELLA DATA
    function stampa_data($data){
    $print_date=explode('-',$data);
    $data=$print_date[2]."-".$print_date[1]."-".$print_date[0];
    return $data;
    }
    // FINE FUNZIONE PER LA STAMPA DELLA DATA



    // Popola il database dato un xls
    function popola($file,$id_associazione){
   	
        $data = new Spreadsheet_Excel_Reader();
        //$data->setOutputEncoding('CP1251'); //UTF-8
        $data->setOutputEncoding('UTF-8');
        $data->read($file);
        error_reporting(E_ALL ^ E_NOTICE);
       	
        $counter= 0;
        $counterP=0;

        $log_error = new log();
        for ($i = 2; $i <= $data->sheets[0]['numRows']; $i++) {
        	$counterP++;
        	echo $counterP." ";
        	if($counterP % 100 == 0){
        		echo "\n  Processati: " . $counterP . "\n";
        	}
        	ob_flush();
         	flush();
        	
        	$query="INSERT into soci (nome,mail) values ";
            $query.="(";
                    $actual_element=trim($data->sheets[0]['cells'][$i][1], " \t\n\r\0\x0B,;");
                    $actual_element=((isset($GLOBALS["___mysqli_ston"]) && is_object($GLOBALS["___mysqli_ston"])) ? mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $actual_element) : ((trigger_error("[MySQLConverterToo] Fix the mysql_escape_string() call! This code does not work.", E_USER_ERROR)) ? "" : ""));
                    $actual_element2=trim($data->sheets[0]['cells'][$i][2], " \t\n\r\0\x0B,;");
                    $mail=((isset($GLOBALS["___mysqli_ston"]) && is_object($GLOBALS["___mysqli_ston"])) ? mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $actual_element2) : ((trigger_error("[MySQLConverterToo] Fix the mysql_escape_string() call! This code does not work.", E_USER_ERROR)) ? "" : ""));
                    $query.="'".$actual_element."','".$mail."'";                         
            // Aggiungi user e password
            //$query.="'".(($email=="") ? getUniqueCode(10) : $email)."','".getUniqueCode(10)."',$id_associazione";
            $query.=")";
            //validate email
            if(!Swift_Validate::email($actual_element2)){ //validate email, log error
            	$log_error->scrivi_popola($actual_element . "\t" . $mail);
            }else{ //insert into DB	
	            $result=mysqli_query($GLOBALS["___mysqli_ston"], "SELECT id FROM soci WHERE mail='" .$mail ."'");
	            if($riga=mysqli_fetch_assoc($result)){ //if the mail is  already in the database
	            	$int_id=$riga['id'];
	            }else{
	            	if (!mysqli_query($GLOBALS["___mysqli_ston"], $query)){  //insert new record
	            		echo $query;
	            		return false;
	            	}
	            	$int_id=((is_null($___mysqli_res = mysqli_insert_id($GLOBALS["___mysqli_ston"]))) ? false : $___mysqli_res);
	            	$counter++;
	            }
	            
	            if($id_associazione > 0){
	            	mysqli_query($GLOBALS["___mysqli_ston"], "INSERT into interessi_soci (id_socio,id_interesse) values ('$int_id','$id_associazione')");
	            }
            }
                            
        }     
        $log_error->close_popola();
        
        //return $data->sheets[0]['numRows']-1;

        return "<BR>Letti " . $counterP . " e inseriti (non duplicati) " . $counter;
    }



    // Crea una stringa random di lunghezza $length
    function getUniqueCode($length = ""){
	$code = md5(uniqid(rand(), true));
	if ($length != "")
            return substr($code, 0, $length);
        else
            return $code;
    }


    // Ritorna menu a tendina delle associazioni
    //used in popola to list associazioni in form for user
    function retrieve_associazioni(){
    	include_once '../config.inc.php';

    	$db = ($GLOBALS["___mysqli_ston"] = mysqli_connect($db_host,  $db_user,  $db_password, $db_name));
    	if ($db == FALSE) {
    		die("Errore nella connessione. Verificare i parametri nel file config.inc.php retrieve");
    	}
    	//((bool)mysqli_query( $db, "USE $db_name")) or die("Errore nella selezione del database. Verificare i parametri nel file config.inc.php");
    	   	
        $stringa='<select name="id_associazione">';
        $stringa.="<option value='0'> Nessun Interesse </option>";
        $query="select id,nome from interessi order by nome";
        $result=mysqli_query($GLOBALS["___mysqli_ston"], $query);
        while($riga=mysqli_fetch_assoc($result)){    
            $stringa.="
                <option value='".$riga['id']."'";
            $stringa.=">".$riga['nome']."</option>";          
        }
        $stringa.="</select>";
        return $stringa;
    }


?>
