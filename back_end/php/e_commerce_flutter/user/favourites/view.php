<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$myview = 'favouritesview';

$statement = $con->prepare("SELECT * FROM $myview WHERE favorite_userid = ?");


$statement->execute(
    array(
        $user_id,
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