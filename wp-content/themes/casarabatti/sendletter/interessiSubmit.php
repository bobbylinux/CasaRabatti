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
                $interesse = mysqli_real_escape_string($con, ucwords(strtolower(trim($_POST['interesse']))));
                if ($interesse != "") {
                    $query_insert = "insert into INTERESSI (nome) values ('$interesse');";
                    $result = mysqli_query($con, $query_insert);
                    $id = mysqli_insert_id($con);
                    $data['success'] = true;
                    $data['message'] = '<tr><td class="col-xs-8"><span class="interesse-td">'.$interesse.'</span><input type="text" class="form-control interesse-edit-input" value="'.$interesse.'" ></td><td class="col-xs-4 text-right"><button type="button" class="btn btn-primary btn-edit-interesse" data-id="' . $id . '">Modifica</button><button type="button" class="btn btn-danger btn-del-interesse" data-id="' . $id . '">Elimina</button></td></tr>';
                } else {

                    $data['success'] = false;
                    $data['errors'] = "impossibile inserire un valore nullo tra gli interessi";
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
                $interesse = mysqli_real_escape_string($con, ucwords(strtolower(trim($_POST['interesse']))));
                $id = $_POST['id'];
                if ($interesse != "") {
                    $query_update = "UPDATE interessi SET nome = '$interesse' WHERE id = '$id';";
                    $result = mysqli_query($con, $query_update);
                    $data['success'] = true;
                    $data['message'] = stripslashes($interesse);
                } else {
                    $data['success'] = false;
                    $data['errors'] = "impossibile inserire un valore nullo tra gli interessi";
                }
            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in ricerca interesse';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
        case'delete':
            //valido

            try {
                $id = $_POST['id'];
                $query_check = "select count(1) as soci FROM interessi_soci WHERE id_interesse = '$id';";
                $result = mysqli_query($con, $query_check);
                while ($row_check = mysqli_fetch_assoc($result)) {
                    $check = $row_check['soci'];
                }

                if ($check == 0) {
                    $query_delete = "delete from INTERESSI where id ='$id';";
                    $result = mysqli_query($con, $query_delete);
                    $data['success'] = true;
                    $data['message'] = 'Success!';
                } else {
                    $data['success'] = false;
                    $data['errors'] = 'Sono presenti dei soci con questo interesse collegato, eliminare prima i soci dalla tabella della newsletter';
                }
            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in cancellazione interesse';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
    }
}


echo json_encode($data);