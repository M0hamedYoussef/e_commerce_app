<?php
include '../../../connect.php';

$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');
$item_color = filterRequest('item_color');

$mytable = 'cart';

$mydata = array(
    'cart_itemcolor' => $item_color,
);


updateData($mytable, "cart_userid = '$user_id' AND cart_itemid = '$item_id' ", $mydata);



?>