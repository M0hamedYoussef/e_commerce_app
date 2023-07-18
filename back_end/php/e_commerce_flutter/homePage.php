<?php
include 'connect.php';

$myHomeData;

$myHomeData['status'] = 'success';

$myHomeData['categories'] = getAllData('categories', null, null, null, false);

$myHomeData['items'] = getAllData('itemsview', 'item_discount != 0', 'item_discount DESC', null, false);

echo json_encode($myHomeData);




?>