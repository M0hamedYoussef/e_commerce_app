<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$address_id = filterRequest('address_id');
$city = filterRequest('address_city');
$street = filterRequest('address_street');
$nameOfAddress = filterRequest('address_name');
$lat = filterRequest('address_lat');
$long = filterRequest('address_long');
$phone = filterRequest('user_phonenumber');


$mytable = 'address';

$where = "address_id = '$address_id' ";

$mydata = array(
    'address_city' => $city,
    'address_street' => $street,
    'address_name' => $nameOfAddress,
    'address_lat' => $lat,
    'address_long' => $long,
    'address_phonenumber' => $phone,
);

updateData($mytable, $where, $mydata, true);


?>