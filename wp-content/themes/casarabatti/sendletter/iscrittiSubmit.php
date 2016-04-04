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
//effettuo la validazione

if (isset($_POST['type'])) {
    switch ($_POST['type']) {
        case 'confirm':
            $id = $_POST['id'];
            try {
                if ($id != "") {
                    $query_update = "UPDATE soci SET confermato = 1 WHERE id = $id;";
                    $result = mysqli_query($con, $query_update);
                    $id = mysqli_insert_id($con);
                    $data['success'] = true;
                } else {

                    $data['success'] = false;
                    $data['errors'] = "impossibile inserire un valore nullo tra gli iscritti";
                }
            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in ricerca iscritto';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
        case'delete':
            try {
                $id = $_POST['id'];
                $query_delete = "delete from SOCI where id ='$id';";
                $result = mysqli_query($con, $query_delete);
                $query_delete = "delete from INTERESSI_SOCI where id_socio ='$id';";
                $result = mysqli_query($con, $query_delete);
                $data['success'] = true;
            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in cancellazione interesse';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
    }
}


echo json_encode($data);