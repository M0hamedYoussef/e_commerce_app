<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');
$mytable = 'cart';


$where = "cart_userid = '$user_id' AND cart_itemid = '$item_id' AND cart_inorder = '0'";
deleteData($mytable, $where);


?>