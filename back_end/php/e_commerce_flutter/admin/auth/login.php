<?php
include '../../connect.php';

$email = filterRequest('email');
$password = sha1(filterRequest('password'));
$newVerifycode = rand(10000, 90000);

//
$mytable = 'admin';


$statement = $con->prepare("SELECT * FROM $mytable WHERE admin_email = ?");
$statement->execute(
    array(
        $email,
    ),
);

$mycount = $statement->rowCount();

$mystmntData = $statement->fetchAll(PDO::FETCH_ASSOC);


if ($mycount > 0) {
    if ($password == $mystmntData[0]['admin_password']) {
        unset($mystmntData[0]['admin_password']);
        unset($mystmntData[0]['admin_verifycode']);
        echo json_encode(array("status" => "success", "data" => $mystmntData[0]));
    } else if ($password != $mystmntData[0]['admin_password']) {
        echo json_encode(array("status" => "wrong pass"));
    }
} else {
    echo json_encode(array("status" => "not exists"));
}

?>