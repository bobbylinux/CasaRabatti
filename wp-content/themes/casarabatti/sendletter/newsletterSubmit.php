<?php
// getting the captcha
$captcha = "";
/*if (isset($_POST["captchaResponse"]))
    $captcha = $_POST["captchaResponse"];

if (!$captcha) {
    $errors['captcha'] = 'Captcha non validato';
    $data['success'] = false;
    $data['errors'] = $errors;
    echo json_encode($data);
    die;
}
// handling the captcha and checking if it's ok
$secret = "6LfagxsTAAAAAP7qlIQueQWBgyAXIMLcyOxfo_bb";
$response = json_decode(file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=" . $secret . "&response=" . $captcha . "&remoteip=" . $_SERVER["REMOTE_ADDR"]), true);

// if the captcha is cleared with google, send the mail and echo ok.
if ($response["success"] == false) {
    $errors['captcha'] = 'Captcha non validato';
    $data['success'] = false;
    $data['errors'] = $errors;
    echo json_encode($data);
    die;
}*/

require_once('../../../wp-config.php');

$errors = array();      // array to hold validation errors
$data = array();      // array to pass back data

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

if (empty($_POST['email']))
    $errors['email'] = 'Email richiesta.';

if (empty($_POST['interessi']))
    $errors['interessi'] = 'Seleziona almeno un interesse per iscriverti.';

if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
    $errors['email'] = "Inserire un indirizzo mail valido";


if (!empty($errors)) {
    $data['success'] = false;
    $data['errors'] = $errors;

} else {

    $nome = mysqli_real_escape_string($con,trim(strtoupper(trim($_POST['nome']))));
    $email = strtolower(trim($_POST['email']));
    $interessi = trim($_POST['interessi']);

    $query_controllo = "SELECT count(1) as soci FROM soci WHERE mail = '$email'";
    $return = mysqli_query($con, $query_controllo);
    $count = 0;
    while ($fetch = mysqli_fetch_array($return, MYSQLI_ASSOC)) {
        $count = $fetch['soci'];
    }

    if ($count == 0) {
        try {
            $query_check_interessi = "SELECT nome FROM interessi WHERE id in ($interessi);";
            $result = mysqli_query($con, $query_check_interessi);
            $count = 0;
            $interessi_testo = "";
            while ($row_check = mysqli_fetch_assoc($result)) {
                $count++;
                $interessi_testo .= " " . $row_check['nome'].",";
            }

            $interessi_testo=substr($interessi_testo, 0, -1);

            $interessiArray = explode(",", $interessi);
            if (count($interessiArray) !=$count) {
                throw new Exception();
            }
            $query_insert = "INSERT INTO soci (nome, mail) values ('$nome','$email');";
            $return_insert = mysqli_query($con, $query_insert);
            $idSocio = mysqli_insert_id($con);

            foreach($interessiArray as $interesse) {
                $query_interessi = "INSERT INTO interessi_soci (id_socio, id_interesse) values ($idSocio,$interesse);";
                $return_interessi = mysqli_query($con, $query_interessi);
            }

            $data['success'] = true;
            $data['message'] = 'Success!';
        } catch (mysqli_sql_exception $error) {
            $errors['connessione'] = 'Errore in fase di inserimento nel database';
            $data['success'] = false;
            $data['errors'] = $errors;
        } catch (Exception $error) {
            $errors['interessi'] = 'Gli interessi selezionati non sono presenti nel sistema';
            $data['success'] = false;
            $data['errors'] = $errors;
        }

    } else {
        $data['success'] = false;
        $errors['informazioni'] = 'Le tue informazioni sono presenti nel nostro sistema';
        $data['errors'] = $errors;

    }


    //sending email
    if ($data['success']) {
        try {
            $to = 'info@casarabatti.it'; // Add your email address inbetween the '' replacing yourname@yourdomain.com - This is where the form will send a message to.
            $email_subject = "Richiesta di iscrizione alla newsletter casarabatti.it:  $nome";
            $email_body = "Hai appena ricevuto una richiesta di iscrizione alla newsletter di casarabatti.it.\n\n" . "Ecco i dettagli:\n\nNome: $nome\n\nEmail: $email\n\n Interessi: $interessi_testo\n\n";
            $headers = "MIME-Version: 1.0\r\n";
            $headers .= "Content-type: text/html; charset=utf-8\r\n";
            $headers .= "From: $nome - <$email>\n";
            mail($to, $email_subject, $email_body, $headers);
        } catch(Exception $error) {
            $data['success'] = false;
            $errors['mail'] = $error->getMessage();
            $data['errors'] = $errors;
        }
    }
}

// return all our data to an AJAX call
echo json_encode($data);