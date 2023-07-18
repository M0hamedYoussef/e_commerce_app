<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$order_id = filterRequest('order_id');

$mytable = 'orders';
$where = "order_userid = '$user_id' AND order_status = 'in prepration' AND order_id = '$order_id' ";

$approve = array(
    "order_status" => "prepared",
);
$user_id = 'users' . "$user_id";

updateData($mytable, $where, $approve);
sendNotification('Your Order Status Changed', 'You Order Is Prepared', $user_id);
?>