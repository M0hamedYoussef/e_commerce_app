<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');

$mytable = 'favourites';

$where = "favorite_userid = '$user_id' AND favorite_itemid = '$item_id' ";

deleteData($mytable, $where);


?>