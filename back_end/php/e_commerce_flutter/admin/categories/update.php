<?php
include '../../connect.php';

$categorie_id = filterRequest('categorie_id');
$categorie_name_en = filterRequest('categorie_name_en');
$categorie_name_ar = filterRequest('categorie_name_ar');
$old_image = filterRequest('old_image');

$mytable = 'categories';
$where = "categorie_id = '$categorie_id'";

$img = imageUpload('../../categories/images', 'categorie_image');

if ($img == 'empty') {
    $data = array(
        'categorie_name_en' => $categorie_name_en,
        'categorie_name_ar' => $categorie_name_ar,
    );
} else {
    $data = array(
        'categorie_image' => $img,
        'categorie_name_en' => $categorie_name_en,
        'categorie_name_ar' => $categorie_name_ar,
    );
    deleteFile('../../categories/images', $old_image);
}

updateData($mytable, $where, $data);

?>