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
        case 'add':
            //valido
            try {
                $indirizzo = mysqli_real_escape_string($con, (strtolower(trim($_POST['indirizzo']))));
                if ($indirizzo != "") {
                    $query_insert = "insert into SOCI_PROVA (mail) values ('$indirizzo');";
                    $result = mysqli_query($con, $query_insert);
                    $id = mysqli_insert_id($con);
                    $data['success'] = true;
                    $data['message'] = '<tr><td class="col-xs-8"><span class="iscritto-prova-td">' . $indirizzo . '</span><input type="text" class="form-control iscritto-prova-edit-input" value="' . $indirizzo . '" ></td><td class="col-xs-4 text-right"><button type="button" class="btn btn-primary btn-edit-iscritto-prova" data-id="' . $id . '">Modifica</button><button type="button" class="btn btn-danger btn-del-iscritto-prova" data-id="' . $id . '">Elimina</button></td></tr>';
                } else {

                    $data['success'] = false;
                    $data['errors'] = "impossibile inserire un valore nullo tra gli iscritti";
                }
            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in ricerca interesse';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
        case 'edit':
            //valido
            try {
                $indirizzo = strtolower(trim($_POST['indirizzo']));
                $id = $_POST['id'];
                if ($indirizzo != "") {
                    $query_update = "UPDATE soci_prova SET mail = '$indirizzo' WHERE id = '$id';";
                    $result = mysqli_query($con, $query_update);
                    $data['success'] = true;
                    $data['message'] = stripslashes($interesse);
                } else {
                    $data['success'] = false;
                    $data['errors'] = "impossibile inserire un valore nullo tra gli indirizzi";
                }
            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in ricerca interesse';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
        case'delete':
            //valido
            $id = $_POST['id'];
            try {

                $query_delete = "delete from SOCI_PROVA where id ='$id';";
                $result = mysqli_query($con, $query_delete);
                $data['success'] = true;
                $data['message'] = 'Success!';

            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in cancellazione iscritti';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
    }
}


echo json_encode($data);