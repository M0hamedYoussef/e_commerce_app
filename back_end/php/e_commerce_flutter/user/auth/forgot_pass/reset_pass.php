<?php
include '../../../connect.php';

$email = filterRequest('email');
$password = sha1(filterRequest('password'));
$verifycode = rand(10000, 90000);

//
$mytable = 'users';


$statement = $con->prepare("SELECT * FROM $mytable WHERE user_email = ?");
$statement->execute(
    array(
        $email,
    ),
);

$mycount = $statement->rowCount();


if ($mycount > 0) {
    $newPassword = array(
        'user_password' => $password,
        'user_verifycode' => $verifycode,

    );
    updateData(
        $mytable,
        "user_email = '$email'",
        $newPassword,
    );
} else {
    echo json_encode(array("status" => "not exists"));
}

?>