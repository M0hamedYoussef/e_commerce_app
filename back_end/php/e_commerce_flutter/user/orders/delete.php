<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$order_id = filterRequest('order_id');

$mytable = 'orders';

$where = "order_userid = '$user_id' AND order_id = '$order_id' AND  order_status = 'pending' ";

updateData($mytable, $where, array("order_status" => "canceled"));

?>