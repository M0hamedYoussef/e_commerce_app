<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');
$mytable = 'favourites';


$mydata = array(
    'favorite_userid' => $user_id,
    'favorite_itemid' => $item_id,
);

insertData($mytable, $mydata);



?>