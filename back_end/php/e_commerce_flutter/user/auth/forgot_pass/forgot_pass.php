<?php
include '../../../connect.php';

$email = filterRequest('email');
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
$mystmntData = $statement->fetchAll(PDO::FETCH_ASSOC);



if ($mycount > 0) {
    if ($mystmntData[0]['user_approve'] == 0) {
        $newCode = array(
            'user_approve' => '1',
            'user_verifycode' => $verifycode,
        );

        updateData(
            $mytable,
            "user_email = '$email'",
            $newCode,
        );
        // sendMail($email, $subject, $message, 'From E-Commerce App'); //NEED HOST
    } else {
        $newCode = array(
            'user_verifycode' => $verifycode,
        );
        updateData(
            $mytable,
            "user_email = '$email'",
            $newCode,
        );
        // sendMail($email, $subject, $message, 'From E-Commerce App'); //NEED HOST

    }
} else {
    echo json_encode(array("status" => "not exists"));
}

?>