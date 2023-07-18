<?php
include '../../../connect.php';

$delivery_id = filterRequest('delivery_id');

$mytable = 'ordersviewdelivery';
$where = "order_status = 'out for delivery' AND order_deliveryid = '$delivery_id' ";

getAllData($mytable,$where);
?>