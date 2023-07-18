<?php
include '../../connect.php';

$user_id = filterRequest('user_id');

$where = "notification_userid = '$user_id'";


getAllData('notifications', $where);

?>