<?php
include '../../connect.php';

$user_id = filterRequest('user_id');

$myview = 'ordersview';

$where = "order_userid = '$user_id' AND order_appear = '1' AND order_status = 'done' ";


getAllData($myview, $where);

?>