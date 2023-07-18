<?php
include '../../connect.php';

$email = filterRequest('email');
$password = sha1(filterRequest('password'));
$newVerifycode = rand(10000, 90000);

//
$mytable = 'users';


$statement = $con->prepare("SELECT * FROM $mytable WHERE user_email = ?");
$statement->execute(
    array(
        $email,
    ),
);

$mycount = $statement->rowCount();

$mystmntData = $statement->fetchAll(PDO::FETCH_ASSOC);


if ($mycount > 0) {
    if ($mystmntData[0]['user_approve'] == 1 && $password == $mystmntData[0]['user_password']) {
        unset($mystmntData[0]['user_password']);
        unset($mystmntData[0]['user_verifycode']);
        echo json_encode(array("status" => "success", "data" => $mystmntData[0]));
    } else if ($mystmntData[0]['user_approve'] == 0 && $password == $mystmntData[0]['user_password']) {
        $verify = array(
            'user_verifycode' => $newVerifycode,
        );
        updateData(
            $mytable,
            "user_email = '$email' AND user_password = '$password' ",
            $verify,
            false,
        );
        echo json_encode(array("status" => "not verified"));
        // sendMail($email, $subject, $message, 'From E-Commerce App'); //NEED HOST
    } else if ($password != $mystmntData[0]['user_password']) {
        echo json_encode(array("status" => "wrong pass"));
    }
} else {
    echo json_encode(array("status" => "not exists"));
}

?>