<?php
include '../../connect.php';

$mytable = 'ordersview';
$where = "order_status = 'pending'";

getAllData($mytable, $where);

?>