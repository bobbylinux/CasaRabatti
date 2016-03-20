<?php

require_once('../../../wp-config.php');

try {
    $con = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
    mysqli_select_db($con, "casarabatti");
} catch (mysqli_sql_exception $error) {
    echo json_encode(array("error" => $error->getMessage()));
}

$events = array();
$query = mysqli_query($con, "select  cal_calendario.id as id,
                                        cal_clienti.nome as cliente,
                                        cal_calendario.inizio as inizio,
                                        cal_calendario.fine as fine,
                                        cal_calendario.ambiente as ambiente,
                                        cal_ambienti.colore as colore
                                 from cal_calendario
                                 JOIN cal_ambienti
                                 ON cal_ambienti.id = cal_calendario.ambiente
                                 JOIN cal_clienti
                                 ON cal_clienti.id = cal_calendario.cliente");
if (!$query) {
    echo json_encode(array("Error:" => mysqli_error($con)));
    exit();
}
while ($fetch = mysqli_fetch_array($query, MYSQLI_ASSOC)) {
    $e = array();
    $e['id'] = $fetch['id'];
    $e['title'] = $fetch['cliente'];
    $e['start'] = $fetch['inizio'];
    $e['end'] = $fetch['fine'];
    $e['color'] = $fetch['colore'];
    $allday = true;
    $e['allDay'] = $allday;
    array_push($events, $e);
}

echo json_encode($events);