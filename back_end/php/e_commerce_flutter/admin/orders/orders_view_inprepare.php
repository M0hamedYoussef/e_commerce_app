<?php
include '../../connect.php';

$mytable = 'ordersview';
$where = "order_status = 'in prepration'";

getAllData($mytable, $where);

?>