<?php 
include '../../../connect.php';

$mytable = 'ordersviewdelivery';
$where = "order_status = 'prepared' AND order_deliveryid = '0' ";

getAllData($mytable,$where);

?>