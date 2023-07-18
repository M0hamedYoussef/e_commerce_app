<?php
include '../../connect.php';

$item_name = filterRequest('item_name');

$mytable = 'itemsview';

getAllData($mytable, "item_name_en LIKE '%$item_name%' OR item_name_ar LIKE '%$item_name%'");
?>