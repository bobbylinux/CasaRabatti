<?php
// getting the captcha
$captcha = "";
if (isset($_POST["captchaResponse"]))
    $captcha = $_POST["captchaResponse"];

if (!$captcha) {
    $errors['captcha'] = 'Captcha non validato';
    $data['success'] = false;
    $data['errors']  = $errors;
    echo json_encode($data);
    die;
}
// handling the captcha and checking if it's ok
$secret = "6LfagxsTAAAAAP7qlIQueQWBgyAXIMLcyOxfo_bb";
$response = json_decode(file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secret."&response=".$captcha."&remoteip=".$_SERVER["REMOTE_ADDR"]), true);

// if the captcha is cleared with google, send the mail and echo ok.
if ($response["success"] == false) {
    $errors['captcha'] = 'Captcha non validato';
    $data['success'] = false;
    $data['errors']  = $errors;
    echo json_encode($data);
    die;
}

require_once('../../../wp-config.php');

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

if (empty($_POST['nome']))
    $errors['nome'] = 'Nome richiesto.';

if (empty($_POST['email']))
    $errors['email'] = 'Email richiesta.';

if ( !empty($errors)) {
    $data['success'] = false;
    $data['errors']  = $errors;
} else {
    $nome = strtoupper(trim($_POST['nome']));
    $email = strtolower(trim($_POST['email']));

    $query_controllo = "SELECT count(1) as soci FROM soci WHERE mail = '$email'";

    $return =  mysqli_query($con, $query_controllo);
    if (!$return) {
        echo json_encode(array("Error:" => mysqli_error($con)));
        exit();
    }
    $count = 0;
    while ($fetch = mysqli_fetch_array($return, MYSQLI_ASSOC)) {
        $count =  $fetch['soci'];
    }

    if ($count == 0) {
        try {
            $query_insert = "INSERT INTO soci (nome, mail) values ('$nome','$email');";
            $return_insert = mysqli_query($con, $query_insert);
            $data['success'] = true;
            $data['message'] = 'Success!';
        } catch (mysqli_sql_exception $error) {
            $errors['connessione'] = 'Errore in fase di inserimento nel database';
            $data['success'] = false;
            $data['errors']  = $errors;
        }

    } else {
        $data['success'] = true;
        $data['message'] = 'User Already Stored Into System!';
    }

}

// return all our data to an AJAX call
echo json_encode($data);