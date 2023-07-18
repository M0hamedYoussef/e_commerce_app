<?php
include '../../connect.php';

$user_id = filterRequest('user_id');
$cart_id = filterRequest('cart_id');
$item_price = filterRequest('item_price');
$coupon = filterRequest('coupon');
$address_id = filterRequest('address_id');
$payment_method = filterRequest('payment_method');
$currentDate = date("Y-m-d H:i:s");

$statement = $con->prepare("SELECT * FROM coupon WHERE coupon = ? AND coupon_expiry > ? AND coupon_usage_count > 0 ");
$statement->execute(
    array(
        $coupon,
        $currentDate,
    ),
);
$mycount = $statement->rowCount();


if ($mycount > 0) {
    $mystmntData = $statement->fetchAll(PDO::FETCH_ASSOC);
    $couponUsage = $mystmntData[0]['coupon_usage_count'];
    $couponMinus = array(
        'coupon_usage_count' => $couponUsage - 1,
    );
    updateData('coupon', "coupon = '$coupon' ", $couponMinus, false);

    $mydata = array(
        'order_userid' => $user_id,
        'order_cartid' => $cart_id,
        'order_coupon' => $coupon,
        'order_addressid' => $address_id,
        'item_price' => $item_price,
        'order_paymentmethod' => $payment_method,
    );
    insertData('orders', $mydata, false);

    updateData(
        'cart',
        "cart_userid = '$user_id'",
        array(
            'cart_inorder' => 1
        ),
        false
    );
} else {
    $mydata = array(
        'order_userid' => $user_id,
        'order_cartid' => $cart_id,
        'order_coupon' => 'default',
        'order_addressid' => $address_id,
        'item_price' => $item_price,
        'order_paymentmethod' => $payment_method,
    );
    insertData('orders', $mydata, false);

    updateData(
        'cart',
        "cart_userid = '$user_id'",
        array(
            'cart_inorder' => 1
        ),
        false
    );
}

echo json_encode(array("status" => "success"));

?>