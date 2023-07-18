import 'dart:io';
import 'package:e_commerce_admin/core/class/crud.dart';
import 'package:e_commerce_admin/core/const/links.dart';

class CategoriesData {
  Crud crud;

  CategoriesData({required this.crud});

  getCategories() async {
    var res = await crud.getData(
      link: AppLinks.categoriesView,
    );
    return res.fold((l) => l, (r) => r);
  }

  addCategorie({
    required File img,
    required String categorieNameEn,
    required String categorieNameAr,
  }) async {
    var res = await crud.getData(
      link: AppLinks.categoriesAdd,
      requsetname: 'categorie_image',
      file: img,
      data: {
        'categorie_name_en': categorieNameEn.trim(),
        'categorie_name_ar': categorieNameAr.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  editCategorie({
    File? img,
    required String oldImageName,
    required String categorieId,
    required String categorieNameEn,
    required String categorieNameAr,
  }) async {
    var res = await crud.getData(
      link: AppLinks.categoriesUpdate,
      requsetname: 'categorie_image',
      file: img,
      data: {
        'old_image': oldImageName.trim(),
        'categorie_id': categorieId.trim(),
        'categorie_name_en': categorieNameEn.trim(),
        'categorie_name_ar': categorieNameAr.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  deleteCategorie({
    required String categorieId,
    required String categorieImg,
  }) async {
    var res = await crud.getData(
      link: AppLinks.categoriesDelete,
      data: {
        'categorie_image': categorieImg.trim(),
        'categorie_id': categorieId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
