<?php
include '../../connect.php';
$user_id = filterRequest('user_id');
$order_createddate = filterRequest('order_createddate');


$mytable = 'orders';
$where = "order_userid = '$user_id' AND order_status = 'out for delivery' AND order_createddate LIKE '%$order_createddate%' ";
$complete = array(
    "order_status" => "done",
);

$user_id = 'users' . "$user_id";


updateData($mytable,$where,$complete);
sendNotification('Your Order Status Changed','You Order Has Been Delivered',$user_id);
sendNotification("User '$user_id' Order" ,"Order For User'$user_id' Has Been Delivered To User '$user_id' ",'admin');
?>