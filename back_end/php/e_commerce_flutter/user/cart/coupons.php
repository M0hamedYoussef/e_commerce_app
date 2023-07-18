<?php
include '../../connect.php';

$mytable = 'coupon';

$currentDate = date("Y-m-d H:i:s");

$statement = $con->prepare("SELECT * FROM $mytable WHERE coupon_expiry > '$currentDate' AND coupon_usage_count > 0 ");

$statement->execute();

$mycount = $statement->rowCount();

$mystmntData = $statement->fetchAll(PDO::FETCH_ASSOC);


if ($mycount > 0) {
    echo json_encode(array("status" => "success", "data" => $mystmntData));
} else {
    echo json_encode(array("status" => "no coupons"));
}

?>