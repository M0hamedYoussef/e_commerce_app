<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$phone = filterRequest('user_phonenumber');
$city = filterRequest('address_city');
$street = filterRequest('address_street');
$nameOfAddress = filterRequest('address_name');
$lat = filterRequest('address_lat');
$long = filterRequest('address_long');

$mytable = 'address';


$mydata = array(
    'address_userid' => $user_id,
    'address_city' => $city,
    'address_street' => $street,
    'address_name' => $nameOfAddress,
    'address_lat' => $lat,
    'address_long' => $long,
    'address_phonenumber' => $phone,
);

insertData($mytable, $mydata,);



?>