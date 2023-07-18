<?php
include '../../connect.php';

$username = filterRequest('username');
$email = filterRequest('email');
$phone = filterRequest('phone');
$verifycode = rand(10000, 90000);
$password = sha1(filterRequest('password'));

//
$mytable = 'users';
$mydata = array(
    'user_username' => $username,
    'user_email' => $email,
    'user_phone' => $phone,
    'user_password' => $password,
    'user_verifycode' => $verifycode,
);


$statement = $con->prepare("SELECT * FROM $mytable WHERE user_email = ? OR user_phone = ? ");
$statement->execute(
    array(
        $email,
        $phone,
    ),
);
$mycount = $statement->rowCount();

if ($mycount == 0 && (trim($email) != '' and trim($phone) != '')) {
    $subject = 'Verify Code';
    $message = $verifycode;
    insertData($mytable, $mydata);
    // sendMail($email, $subject, $message, 'From E-Commerce App'); //NEED HOST
} else
    if ($mycount > 0) {
        echo json_encode(array("status" => "failure"));
    }

?>