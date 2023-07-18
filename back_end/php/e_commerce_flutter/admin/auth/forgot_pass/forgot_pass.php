<?php
include '../../../connect.php';

$email = filterRequest('email');
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
$mystmntData = $statement->fetchAll(PDO::FETCH_ASSOC);



if ($mycount > 0) {
    $newCode = array(
        'admin_verifycode' => $verifycode,
    );
    updateData(
        $mytable,
        "admin_email = '$email'",
        $newCode,
    );
    // sendMail($email, $subject, $message, 'From E-Commerce App'); //NEED HOST
} else {
    echo json_encode(array("status" => "not exists"));
}

?>