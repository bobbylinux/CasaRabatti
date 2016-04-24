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

    switch($_POST['type']) {
        case "add":
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
            break;
        case "edit":
            $id = $_POST['id'];
            try {
                $query_update = "UPDATE cal_clienti SET nome = '$nome', mail = '$email', telefono = '$telefono', indirizzo = '$indirizzo', citta = '$citta', nazione = '$nazione' where id = $id";
                $return_update = mysqli_query($con, $query_update);
                $data['success'] = true;
                $data['message'] = 'Success!';
            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in fase di inserimento nel database';
                $data['success'] = false;
                $data['errors']  = $errors;
            }
            break;
    }
}

// return all our data to an AJAX call
echo json_encode($data);