<?php
include '../../connect.php';

$item_active = filterRequest('item_active');
$item_categorie = filterRequest('item_categorie');
$item_name_en = filterRequest('item_name_en');
$item_name_ar = filterRequest('item_name_ar');
$item_desc_en = filterRequest('item_desc_en');
$item_desc_ar = filterRequest('item_desc_ar');
$item_discount = filterRequest('item_discount');
$item_price = filterRequest('item_price');
$item_count = filterRequest('item_count');
$item_colors = filterRequest('item_colors');

$mytable = 'items';

$img = imageUpload('../../items/images', 'item_image');

$data = array(
    'item_active' => $item_active,
    'item_categorie' => $item_categorie,
    'item_image' => $img,
    'item_name_en' => $item_name_en,
    'item_name_ar' => $item_name_ar,
    'item_desc_en' => $item_desc_en,
    'item_desc_ar' => $item_desc_ar,
    'item_discount' => $item_discount,
    'item_price' => $item_price,
    'item_count' => $item_count,
    'item_colors' => $item_colors,
);

insertData($mytable, $data);

?>