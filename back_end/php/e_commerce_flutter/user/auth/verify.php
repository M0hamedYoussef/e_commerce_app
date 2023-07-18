<?php
include '../../connect.php';

$verifycode = filterRequest('verifycode');
$email = filterRequest('email');
$newVerifycode = rand(10000, 90000);


//
$mytable = 'users';
//

$statement = $con->prepare("SELECT * FROM $mytable WHERE user_email = ? AND user_verifycode = ? ");
$statement->execute(
    array(
        $email,
        $verifycode,
    ),
);


$mycount = $statement->rowCount();
$mystmntData = $statement->fetchAll(PDO::FETCH_ASSOC);


if ($mycount > 0) {
    if ($mystmntData[0]['user_approve'] == 0) {
        $approve = array(
            'user_approve' => '1',
            'user_verifycode' => $newVerifycode,
        );
        updateData(
            $mytable,
            "user_email = '$email' AND user_verifycode = '$verifycode' ",
            $approve,
        );
    } else if ($mystmntData[0]['user_approve'] == 1) {
        echo json_encode(array("status" => "success"));
    }
} else {
    echo json_encode(array("status" => "failure", "error" => "wrong email : '$email' or verifycode : '$verifycode' "));
}


?>