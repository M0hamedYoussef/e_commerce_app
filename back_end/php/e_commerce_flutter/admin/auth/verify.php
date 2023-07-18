<?php
include '../../connect.php';

$verifycode = filterRequest('verifycode');
$email = filterRequest('email');
$newVerifycode = rand(10000, 90000);


//
$mytable = 'admin';
//

$statement = $con->prepare("SELECT * FROM $mytable WHERE admin_email = ? AND admin_verifycode = ? ");
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