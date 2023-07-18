<?php
include '../../connect.php';

$items_id = filterRequest('item_id');
$items_image = filterRequest('item_image');


$mytable = 'items';
$where = "item_id = '$items_id'";

deleteFile('../../items/images', $items_image);
deleteData($mytable, $where);

?>