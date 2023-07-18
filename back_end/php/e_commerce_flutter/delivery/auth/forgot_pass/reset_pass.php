<?php
include '../../../connect.php';

$email = filterRequest('email');
$password = sha1(filterRequest('password'));
$verifycode = rand(10000, 90000);

//
$mytable = 'delivery';


$statement = $con->prepare("SELECT * FROM $mytable WHERE delivery_email = ?");
$statement->execute(
    array(
        $email,
    ),
);

$mycount = $statement->rowCount();


if ($mycount > 0) {
    $newPassword = array(
        'delivery_password' => $password,
        'delivery_verifycode' => $verifycode,

    );
    updateData(
        $mytable,
        "delivery_email = '$email'",
        $newPassword,
    );
} else {
    echo json_encode(array("status" => "not exists"));
}

?>