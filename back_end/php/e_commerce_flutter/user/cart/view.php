<?php
include '../../connect.php';

$user_id = filterRequest('user_id');

$myview = 'cartview';

$statement = $con->prepare("SELECT * FROM $myview WHERE cart_userid = ? AND cart_inorder = ? ");

$statement->execute(
    array(
        $user_id,
        0,
    ),
);

$mycount = $statement->rowCount();

$mystmntData = $statement->fetchAll(PDO::FETCH_ASSOC);


if ($mycount > 0) {
    echo json_encode(array("status" => "success", "data" => $mystmntData));
} else {
    echo json_encode(array("status" => "not exists"));
}

?>