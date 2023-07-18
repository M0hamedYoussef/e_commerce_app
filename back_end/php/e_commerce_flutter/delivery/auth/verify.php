<?php
include '../../connect.php';

$verifycode = filterRequest('verifycode');
$email = filterRequest('email');
$newVerifycode = rand(10000, 90000);


//
$mytable = 'delivery';
//

$statement = $con->prepare("SELECT * FROM $mytable WHERE delivery_email = ? AND delivery_verifycode = ? ");
$statement->execute(
    array(
        $email,
        $verifycode,
    ),
);


$mycount = $statement->rowCount();
$mystmntData = $statement->fetchAll(PDO::FETCH_ASSOC);


if ($mycount > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure", "error" => "wrong email : '$email' or verifycode : '$verifycode' "));
}


?>