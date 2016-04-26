<?php
require_once('../../../wp-config.php');

$errors = array();      // array to hold validation errors
$data = array();      // array to pass back data
$minStay = MIN_STAY;
try {
    $con = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
    mysqli_select_db($con, "casarabatti");
} catch (mysqli_sql_exception $error) {
    $errors['connessione'] = 'Nessuna connessione al database';
    $data['success'] = false;
    $data['errors'] = $errors;
    echo json_encode($data);
}

if (empty($_POST['nome']))
    $errors['nome'] = 'Nome richiesto.';

if (empty($_POST['mail']))
    $errors['mail'] = 'Email richiesta.';

if (empty($_POST['telefono']))
    $errors['telefono'] = 'Numero di telefono richiesto.';

if (empty($_POST['adulti']))
    $errors['adulti'] = 'Numero di adulti richiesto.';

if (empty($_POST['bambini']))
    $errors['bambini'] = 'Numero di bambini richiesto.';

if (empty($_POST['arrivo']))
    $errors['arrivo'] = 'Indicare la data di arrivo';

if (empty($_POST['partenza']))
    $errors['partenza'] = 'Indicare la data di partenza';

$arrivoTmp = $_POST['arrivo'];
$partenzaTmp = $_POST['partenza'];

$arrivoTmp = str_replace('/', '-', $arrivoTmp);
$arrivoTmp = date("Y-m-d", strtotime($arrivoTmp));
$partenzaTmp = str_replace('/', '-', $partenzaTmp);
$partenzaTmp = date("Y-m-d", strtotime($partenzaTmp));

$datadiff = (round(abs(strtotime($partenzaTmp)-strtotime($arrivoTmp))/86400));

if ($datadiff < $minStay) {
    $errors['partenza'] = "La durata minima del soggiorno deve essere di 5 giorni.";
}

if (!filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL))
    $errors['mail'] = "Inserire un indirizzo mail valido";

if (!empty($errors)) {
    $data['success'] = false;
    $data['errors'] = $errors;

} else {
    $nome = mysqli_real_escape_string($con, trim(strtoupper(trim($_POST['nome']))));
    $email = strtolower(trim($_POST['mail']));
    $telefono = $_POST['telefono'];
    $arrivo = $_POST['arrivo'];
    $partenza = $_POST['partenza'];
    $adulti = $_POST['adulti'];
    $bambini = $_POST['bambini'];
    $messaggio = $_POST['messaggio'];
    try {
        $to = 'info@casarabatti.it'; // Add your email address inbetween the '' replacing yourname@yourdomain.com - This is where the form will send a message to.
        $email_subject = "Richiesta di prenotazione:  $nome";
        $email_body = "Hai appena ricevuto una richiesta di prenotazione.<br>" . "Ecco i dettagli:<br>Nome: $nome<br>Telefono: $telefono<br>Email: $email<br>Data Arrivo: $arrivo<br>Data Partenza: $partenza<br>Adulti: $adulti<br>Bambini: $bambini<br>Messaggio: $messaggio";
        $headers = "MIME-Version: 1.0\r\n";
        $headers .= "Content-type: text/html; charset=utf-8\r\n";
        $headers .= "From: $nome - <$email>\n";
        mail($to, $email_subject, $email_body, $headers);

        $data['success'] = true;
    } catch (Exception $error) {
        $data['success'] = false;
        $errors['mail'] = $error->getMessage();
        $data['errors'] = $errors;
    }

}

// return all our data to an AJAX call
echo json_encode($data);