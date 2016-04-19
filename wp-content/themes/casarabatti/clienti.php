<?php
require_once('../../../wp-config.php');

$return_arr = array();

try {
    $con = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
    mysqli_select_db($con, "casarabatti");

    if (isset($_POST['term'])) {

        $term = $_POST['term'];
        $row_num = $_POST['row_num'];
        $query_clienti = "SELECT id, nome FROM cal_clienti WHERE LOWER(TRIM(nome)) LIKE LOWER(TRIM('%" . $term . "%'))";

        $return = mysqli_query($con, $query_clienti);

        while ($fetch = mysqli_fetch_array($return, MYSQLI_ASSOC)) {
            $row_array = $fetch['id'].'|'.$fetch['nome'].'|'.$row_num;
            array_push($return_arr,$row_array);
        }
    }
} catch (mysqli_sql_exception $error) {
    echo json_encode($error);
} finally {
    echo json_encode($return_arr);
}
