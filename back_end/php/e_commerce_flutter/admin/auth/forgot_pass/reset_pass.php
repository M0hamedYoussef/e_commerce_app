<?php
include '../../../connect.php';

$email = filterRequest('email');
$password = sha1(filterRequest('password'));
$verifycode = rand(10000, 90000);

//
$mytable = 'admin';


$statement = $con->prepare("SELECT * FROM $mytable WHERE admin_email = ?");
$statement->execute(
    array(
        $email,
    ),
);

$mycount = $statement->rowCount();


if ($mycount > 0) {
    $newPassword = array(
        'admin_password' => $password,
        'admin_verifycode' => $verifycode,

    );
    updateData(
        $mytable,
        "admin_email = '$email'",
        $newPassword,
    );
} else {
    echo json_encode(array("status" => "not exists"));
}

?>