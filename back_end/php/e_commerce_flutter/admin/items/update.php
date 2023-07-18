<?php
include '../../connect.php';

$items_id = filterRequest('item_id');
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
$old_image = filterRequest('old_image');

$mytable = 'items';
$where = "item_id = '$items_id'";

$img = imageUpload('../../items/images', 'item_image');

if ($img == 'empty') {
    $data = array(
        'item_active' => $item_active,
        'item_categorie' => $item_categorie,
        'item_name_en' => $item_name_en,
        'item_name_ar' => $item_name_ar,
        'item_desc_en' => $item_desc_en,
        'item_desc_ar' => $item_desc_ar,
        'item_discount' => $item_discount,
        'item_price' => $item_price,
        'item_count' => $item_count,
        'item_colors' => $item_colors,
    );
} else {
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
    deleteFile('../../items/images', $old_image);
}

updateData($mytable, $where, $data);

?>