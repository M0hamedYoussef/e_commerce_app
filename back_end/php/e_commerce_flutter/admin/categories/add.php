<?php
include '../../connect.php';

$categorie_name_en = filterRequest('categorie_name_en');
$categorie_name_ar = filterRequest('categorie_name_ar');

$mytable = 'categories';

$img = imageUpload('../../categories/images', 'categorie_image');


$data = array(
    'categorie_image' => $img,
    'categorie_name_en' => $categorie_name_en,
    'categorie_name_ar' => $categorie_name_ar,
);

insertData($mytable, $data);

?>