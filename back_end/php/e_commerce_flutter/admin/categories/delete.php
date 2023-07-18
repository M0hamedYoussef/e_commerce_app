<?php
include '../../connect.php';

$categorie_id = filterRequest('categorie_id');
$categorie_image = filterRequest('categorie_image');

$mytable = 'categories';
$where = "categorie_id = '$categorie_id'";


deleteFile('../../categories/images', $categorie_image);

deleteData($mytable, $where);

?>