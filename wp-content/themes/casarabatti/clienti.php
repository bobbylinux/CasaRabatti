<?php
require_once('../../../wp-config.php');

try {
    $con = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
    mysqli_select_db($con, "casarabatti");

    if (isset($_GET['term'])) {

        $term = $_GET['term'];
        $query_clienti = "SELECT nome FROM cal_clienti WHERE LOWER(TRIM(nome)) LIKE LOWER(TRIM('%" . $term . "%'))";

        $return = mysqli_query($con, $query_clienti);

        while ($fetch = mysqli_fetch_array($return, MYSQLI_ASSOC)) {
            $return_arr[] = $fetch['nome'];
        }
    }
} catch (mysqli_sql_exception $error) {
    echo json_encode($error);
} finally {
    echo json_encode($return_arr);
}
