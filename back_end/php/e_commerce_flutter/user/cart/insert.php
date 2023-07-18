<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');
$item_color = filterRequest('item_color');
$item_count = filterRequest('item_count');

$mytable = 'cart';

$statement = $con->prepare("SELECT * FROM $mytable WHERE cart_userid = ?");

$statement->execute(
    array(
        $user_id,
    ),
);

$mydata = array(
    'cart_userid' => $user_id,
    'cart_inorder' => 0,
    'cart_itemid' => $item_id,
    'cart_itemcolor' => $item_color,
    'cart_itemcount' => $item_count,
);
insertData($mytable, $mydata);



?>