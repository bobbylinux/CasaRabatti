<?php
require_once('../../../../wp-config.php');

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

$rows = array();

try {
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $result_lingue = mysqli_query($con, "select nome,lingua from interessi_i18ns where interesse = $id;");
        while ($row_lingue = mysqli_fetch_assoc($result_lingue)) {
            $rows[] = $row_lingue;
        }
        $lingueSelect .= '</select>';
    }

} catch (mysqli_sql_exception $error) {
    $errors['connessione'] = 'Errore in ricerca lingue';
    $data['success'] = false;
    $data['errors'] = $errors;
}


echo json_encode($rows);