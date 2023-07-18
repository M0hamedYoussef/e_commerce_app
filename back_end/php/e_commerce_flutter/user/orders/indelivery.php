<?php
include '../../connect.php';

$user_id = filterRequest('user_id');

$myView = 'ordersview';
$whereView = "order_userid = '$user_id' AND order_appear = '1' AND order_status = 'out for delivery' ";

$myMap = 'ordersviewdelivery';
$whereMap = "order_status = 'out for delivery' AND order_userid = '$user_id' ";

$stmtForView = $con->prepare("SELECT  * FROM $myView WHERE $whereView ");
$stmtForMap = $con->prepare("SELECT  * FROM $myMap WHERE $whereMap ");

$stmtForView->execute();
$stmtForMap->execute();

$dataView = $stmtForView->fetchAll(PDO::FETCH_ASSOC);
$dataMap = $stmtForMap->fetchAll(PDO::FETCH_ASSOC);
$count = $stmtForView->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success", "$myView" => $dataView, "$myMap" => $dataMap));
} else {
    echo json_encode(array("status" => "failure"));
}


?>