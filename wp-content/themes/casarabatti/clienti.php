<?php
require_once('../../../wp-config.php');

$return_arr = array();

try {
    $con = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
    mysqli_select_db($con, "casarabatti");

    if (isset($_POST['term'])) {

        $term = mysqli_real_escape_string ( $con ,mysqli_real_escape_string ( $con ,$_POST['term']));
        $row_num = $_POST['row_num'];
        $query_clienti = "SELECT id, nome,telefono,mail,indirizzo,citta,nazione FROM cal_clienti WHERE LOWER(TRIM(nome)) LIKE LOWER(TRIM('%" . $term . "%'))";

        $return = mysqli_query($con, $query_clienti);

        while ($fetch = mysqli_fetch_array($return, MYSQLI_ASSOC)) {
            $row_array = $fetch['id'].'|'.stripslashes($fetch['nome']).'|'.$fetch['telefono'].'|'.$fetch['mail'].'|'.stripslashes($fetch['indirizzo']).'|'.stripslashes($fetch['citta']).'|'.stripslashes($fetch['nazione']).'|'.$row_num;
            array_push($return_arr,$row_array);
        }
    }
} catch (mysqli_sql_exception $error) {
    echo json_encode($error);
} finally {
    echo json_encode($return_arr);
}
