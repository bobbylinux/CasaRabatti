<?php
require_once('../../../../wp-config.php');
include "log.php";

$errors         = array();      // array to hold validation errors
$data           = array();      // array to pass back data


try {
    $con = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
    mysqli_select_db($con, "casarabatti");
} catch (mysqli_sql_exception $error) {
    $errors['connessione'] = 'Nessuna connessione al database';
    $data['success'] = false;
    $data['errors']  = $errors;
    echo json_encode($data);
}
//effettuo la validazione

$subject = isset($_POST['oggetto']) ? trim($_POST['oggetto']) : '';
$message = isset($_POST['testo']) ? trim($_POST['testo']) : '';
$subject = addslashes($subject);
$message = str_replace("\n", "<br>", "$message");
$message = addslashes($message);
$date = date('d-m-Y H:i', time());
$invio = $_POST['invio'];
$real = true;

if ($invio == "Invia Una Prova") {
    $real = false;
}

$interessi = array();
$interessi = explode(',',$_POST['interessi']);
$interessiTutti= $_POST['interessiTutti'];

// controlla che i campi non siano vuoti
$iCount = 0;
if ($subject == '') {
    $data['errors'][$iCount]  = 'oggetto';
    $iCount++;
}
if ($message == '') {
    $data['errors'][$iCount]  = 'messaggio';
    $iCount++;
}
if ($interesse=="" && $interessiTutti=="0" && $real) {
    $data['errors'][$iCount]  = 'interessi';
    $iCount++;
}
if ( !empty($data['errors'])) {
    $data['success'] = false;
} else {
    if (!$real) {
        $intQuery = -1;
    } else {
        if ($interessiTutti== "1") {
            $intQuery = "0";
        } else {
            $intQuery = trim($_POST['interessi']);
        }
    }

    try {
        $query_insert = "INSERT INTO mail (id,oggetto,messaggio,associazione,data,inviare) VALUES (NULL,'$subject','$message','$intQuery',NULL,1);";
        $return_insert = mysqli_query($con, $query_insert);
        $data['success'] = true;
        $data['message'] = 'Success!';
    } catch (mysqli_sql_exception $error) {
        $errors['connessione'] = 'Errore in fase di inserimento nel database';
        $data['success'] = false;
        $data['errors']  = $errors;
    }

    if (!$real) {
        $data['message'] = "fake";
    }

}

echo json_encode($data);