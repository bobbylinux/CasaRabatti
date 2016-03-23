<?php
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
    $telefono = strtoupper(trim($_POST['telefono']));
    $indirizzo = strtoupper(trim($_POST['indirizzo']));
    $citta = strtoupper(trim($_POST['citta']));
    $nazione = strtoupper(trim($_POST['nazione']));

    try {
        $query_insert = "INSERT INTO cal_clienti (nome, mail, telefono, indirizzo, citta, nazione) values ('$nome','$email','$telefono','$indirizzo','$citta','$nazione');";
        $return_insert = mysqli_query($con, $query_insert);
        $data['success'] = true;
        $data['message'] = 'Success!';
    } catch (mysqli_sql_exception $error) {
        $errors['connessione'] = 'Errore in fase di inserimento nel database';
        $data['success'] = false;
        $data['errors']  = $errors;
    }

}

// return all our data to an AJAX call
echo json_encode($data);