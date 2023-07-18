<?php
include '../connect.php';

$catigorie_id = filterRequest('item_categorie');

$mytable = 'itemsview';

getAllData($mytable, "item_categorie = '$catigorie_id' AND item_active = '1' ");

?>