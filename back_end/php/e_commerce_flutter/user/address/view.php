<?php
include '../../connect.php';

$user_id = filterRequest('user_id');

$mytable = 'address';

$statement = $con->prepare("SELECT * FROM $mytable WHERE address_userid = ? AND address_appear = ?");


$statement->execute(
    array(
        $user_id,
        '1',
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