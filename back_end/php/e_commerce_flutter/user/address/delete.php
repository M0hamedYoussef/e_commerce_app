<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$address_id = filterRequest('address_id');

$mytable = 'address';

$where = "address_id = '$address_id' AND address_userid = '$user_id' ";

updateData(
    $mytable,
    $where,
    array(
        'address_appear' => '0',
    ),
);


?>