<?php

require_once('../wp-config.php');

$link=mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
mysqli_select_db('casarabatti',$link);
?>
