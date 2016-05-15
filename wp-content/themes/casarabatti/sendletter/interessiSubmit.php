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
            try {
                $interesse = array();
                $lingua = array();

                $data =($_POST['interesse']);
                foreach ($data as $int) {
                    array_push($interesse,$int);
                }

                $data = ($_POST['lingua']);
                foreach ($data as $lang) {
                    array_push($lingua,$lang);
                }

                if (!empty($interesse)) {

                    $query_lingua = "SELECT id FROM lingue WHERE lingua = '" . get_locale() . "' and cancellato = '0'";
                    $result = mysqli_query($con, $query_lingua);
                    $linguaDefault = 0;
                    while ($row_lingue = mysqli_fetch_assoc($result)) {
                        $linguaDefault = $row_lingue['id'];
                    }

                    $query_insert = "insert into INTERESSI (cancellato) values ('0');";
                    $result = mysqli_query($con, $query_insert);
                    $id = mysqli_insert_id($con);

                    for ($i = 0; $i<count($interesse); $i++) {
                        if ($lingua[$i] == $linguaDefault) {
                            $interesseDefault = $interesse[$i];
                        }
                        $query_insert = "insert into interessi_i18ns (interesse,lingua,nome) values ($id,$lingua[$i],'$interesse[$i]');";
                        $result = mysqli_query($con, $query_insert);
                    }
                    $data['success'] = true;
                    $data['message'] = '<tr data-id="'.$id.'"><td class="col-xs-8"><span class="interesse-td">' . $interesseDefault . '</span><input type="text" class="form-control interesse-edit-input" value="' . $interesseDefault . '" ></td><td class="col-xs-4 text-right"><button type="button" class="btn btn-primary btn-edit-interesse" data-id="' . $id . '">Modifica</button><button type="button" class="btn btn-danger btn-del-interesse" data-id="' . $id . '">Elimina</button></td></tr>';
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
            $interesse = array();
            $lingua = array();

            $data =($_POST['interesse']);
            foreach ($data as $int) {
                array_push($interesse,$int);
            }

            $data = ($_POST['lingua']);
            foreach ($data as $lang) {
                array_push($lingua,$lang);
            }

            if (!empty($interesse)) {

                $query_lingua = "SELECT id FROM lingue WHERE lingua = '" . get_locale() . "' and cancellato = '0'";
                $result = mysqli_query($con, $query_lingua);
                $linguaDefault = 0;
                while ($row_lingue = mysqli_fetch_assoc($result)) {
                    $linguaDefault = $row_lingue['id'];
                }
                $id = $_POST['id'];
                for ($i = 0; $i<count($interesse); $i++) {
                    if ($lingua[$i] == $linguaDefault) {
                        $interesseDefault = $interesse[$i];
                    }
                    $query_update = "UPDATE interessi_i18ns SET nome = '$interesse[$i]' WHERE interesse = $id AND lingua = $lingua[$i]";
                    $result = mysqli_query($con, $query_update);
                }
                $data['success'] = true;
                $data['message'] = '<tr data-id="'.$id.'"><td class="col-xs-8"><span class="interesse-td">' . $interesseDefault . '</span><input type="text" class="form-control interesse-edit-input" value="' . $interesseDefault . '" ></td><td class="col-xs-4 text-right"><button type="button" class="btn btn-primary btn-edit-interesse" data-id="' . $id . '">Modifica</button><button type="button" class="btn btn-danger btn-del-interesse" data-id="' . $id . '">Elimina</button></td></tr>';
            } else {
                $data['success'] = false;
                $data['errors'] = "impossibile inserire un valore nullo tra gli interessi";
            }
            break;
        case'delete':
            try {
                $id = $_POST['id'];
                $query_delete = "UPDATE INTERESSI set CANCELLATO = 1 where id ='$id';";
                $result = mysqli_query($con, $query_delete);
                $data['success'] = true;
                $data['message'] = 'Success!';

            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in cancellazione interesse';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
    }
}


echo json_encode($data);