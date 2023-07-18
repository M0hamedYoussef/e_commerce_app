<?php
include '../../connect.php';

$delivery_id = filterRequest('delivery_id');
$order_createddate = filterRequest('order_createddate');
$user_id = filterRequest('user_id');


$mytable = 'orders';
$where = "order_userid = '$user_id' AND order_status = 'prepared' AND order_createddate LIKE '%$order_createddate%' ";

$approve = array(
    "order_status" => "out for delivery",
    "order_deliveryid" => $delivery_id,
);
$user_id = 'users' . "$user_id";


updateData($mytable, $where, $approve);
sendNotification('Your Order Status Changed', 'You Order Has Been Sent Out For Delivery', $user_id);
sendNotification('update', 'One Order Has Been Approved', 'delivery');
sendNotification("User '$user_id' Order", "Order For User'$user_id' Has Been Sent Out For Delivery", 'admin');
?>