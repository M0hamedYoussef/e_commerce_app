<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$order_id = filterRequest('order_id');
$order_createddate = filterRequest('order_createddate');

$mytable = 'orders';
$where = "order_userid = '$user_id' AND order_status = 'pending' AND order_id = '$order_id' ";

$approve = array(
    "order_status" => "approved",
);

updateData($mytable,$where,$approve);
sendNotification('New Order','A New Order Has Been Approved','delivery');

?>