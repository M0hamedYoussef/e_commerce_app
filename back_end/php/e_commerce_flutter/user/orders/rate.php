<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$order_id = filterRequest('order_id');
$order_rate = filterRequest('order_rate');

$where = "order_id = '$order_id' AND order_userid = '$user_id'";


updateData(
    'orders',
    $where,
    array(
        'order_rate' => $order_rate,
    ),
);





?>