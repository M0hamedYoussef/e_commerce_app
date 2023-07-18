<?php
include '../../../connect.php';

$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');

$mytable = 'cart';

$statement = $con->prepare("SELECT cart_itemcolor FROM $mytable WHERE cart_userid = ? AND cart_itemid = ? ");

$statement->execute(
    array(
        $user_id,
        $item_id,
    )
);


$mystmntData = $statement->fetchAll(PDO::FETCH_ASSOC);

$mycount = $statement->rowCount();
if ($mycount > 0) {
    echo json_encode(array("status" => "success", "color" => $mystmntData[0]['cart_itemcolor']));
} else {
    echo json_encode(array("status" => "not exists"));
}

?>