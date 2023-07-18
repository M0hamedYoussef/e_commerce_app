<?php
include '../../connect.php';

$mytable = 'ordersview';
$where = "order_status = 'approved'";

getAllData($mytable, $where);

?>