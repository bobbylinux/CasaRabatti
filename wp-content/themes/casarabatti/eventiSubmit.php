<?php
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

if (empty($_POST['tipo']))
    $errors['tipo'] = 'Tipo operazione richiesto.';

if ($_POST['tipo'] != "delete") {
    if (empty($_POST['cliente']))
        $errors['cliente'] = 'Cliente richiesto.';

    if (empty($_POST['arrivo']))
        $errors['arrivo'] = 'Arrivo richiesto.';

    if (empty($_POST['partenza']))
        $errors['partenza'] = 'Partenza richiesto.';

    if (empty($_POST['ambiente']))
        $errors['ambiente'] = 'Ambiente richiesto.';

    $arrivoTmp = $_POST['arrivo'];
    $partenzaTmp = $_POST['partenza'];

    $arrivoTmp = str_replace('/', '-', $arrivoTmp);
    $arrivoTmp = date("Y-m-d", strtotime($arrivoTmp));
    $partenzaTmp = str_replace('/', '-', $partenzaTmp);
    $partenzaTmp = date("Y-m-d", strtotime($partenzaTmp));

    $datadiff = (round(abs(strtotime($partenzaTmp) - strtotime($arrivoTmp)) / 86400));

    if ($datadiff < 5) {
        $errors['partenza'] = "La durata minima del soggiorno deve essere di 5 giorni.";
    }
}

if (!empty($errors)) {
    $data['success'] = false;
    $data['errors'] = $errors;
} else {
    $cliente = trim($_POST['cliente']);
    $ambiente = trim($_POST['ambiente']);
    switch ($_POST['tipo']) {
        case "new":
            try {
                $query_insert = "INSERT INTO cal_calendario (ambiente, cliente, inizio, fine) values ('$ambiente','$cliente','$arrivoTmp','$partenzaTmp');";
                $return_insert = mysqli_query($con, $query_insert);
                $data['success'] = true;
                $data['message'] = 'Success!';
            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in fase di inserimento nel database';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
        case "edit":
            $idEvento = $_POST['id'];
            try {
                $query_update = "UPDATE cal_calendario SET ambiente = '$ambiente', cliente = '$cliente', inizio = '$arrivoTmp', fine = '$partenzaTmp' WHERE id = $idEvento;";
                $return_update = mysqli_query($con, $query_update);
                $data['success'] = true;
                $data['message'] = 'Success!';
            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in fase di modifica nel database';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
        case "delete":
            $idEvento = $_POST['id'];
            try {
                $query_delete = "DELETE FROM cal_calendario WHERE id = $idEvento;";
                $return_delete = mysqli_query($con, $query_delete);
                $data['success'] = true;
                $data['message'] = 'Success!';
            } catch (mysqli_sql_exception $error) {
                $errors['connessione'] = 'Errore in fase di cancellazione nel database';
                $data['success'] = false;
                $data['errors'] = $errors;
            }
            break;
    }


}

// return all our data to an AJAX call
echo json_encode($data);