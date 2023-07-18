<?php
include '../../../connect.php';

$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');
$item_count = filterRequest('item_count');

$mytable = 'cart';

$mydata = array(
    'cart_itemcount' => $item_count,
);


updateData($mytable, "cart_userid = '$user_id' AND cart_itemid = '$item_id' ", $mydata);



?>