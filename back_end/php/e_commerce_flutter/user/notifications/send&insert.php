<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$title = filterRequest('title');
$message = filterRequest('message');

$noti_data = array(
    'notification_userid' => $user_id,
    'notification_title' => $title,
    'notification_message' => $message,
);

$user_id = 'users'."$user_id";

sendNotification($title, $message, $user_id);

insertData('notifications', $noti_data);


?>