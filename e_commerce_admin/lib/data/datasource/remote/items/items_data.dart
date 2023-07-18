import 'dart:io';
import 'package:e_commerce_admin/core/class/crud.dart';
import 'package:e_commerce_admin/core/const/links.dart';

class ItemsData {
  Crud crud;

  ItemsData({required this.crud});

  getItems() async {
    var res = await crud.getData(
      link: AppLinks.itemsView,
    );
    return res.fold((l) => l, (r) => r);
  }

  addItem({
    required File img,
    required String itemCategorie,
    required String itemsNameEn,
    required String itemsNameAr,
    required String itemDescEn,
    required String itemDescAr,
    required String itemPrice,
    required String itemDiscount,
    required String itemActive,
    required String itemColors,
    required String itemCount,
  }) async {
    var res = await crud.getData(
      link: AppLinks.itemsAdd,
      requsetname: 'item_image',
      file: img,
      data: {
        'item_active': itemActive.trim(),
        'item_categorie': itemCategorie.trim(),
        'item_name_en': itemsNameEn.trim(),
        'item_name_ar': itemsNameAr.trim(),
        'item_desc_en': itemDescEn.trim(),
        'item_desc_ar': itemDescAr.trim(),
        'item_discount': itemDiscount.trim(),
        'item_price': itemPrice.trim(),
        'item_count': itemCount.trim(),
        'item_colors': itemColors.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  editItem({
    File? img,
    required String oldImageName,
    required String itemCategorie,
    required String itemId,
    required String itemsNameEn,
    required String itemsNameAr,
    required String itemDescEn,
    required String itemDescAr,
    required String itemPrice,
    required String itemDiscount,
    required String itemActive,
    required String itemColors,
    required String itemCount,
  }) async {
    var res = await crud.getData(
      link: AppLinks.itemsUpdate,
      requsetname: 'item_image',
      file: img,
      data: {
        'old_image': oldImageName.trim(),
        'item_id': itemId.trim(),
        'item_active': itemActive.trim(),
        'item_categorie': itemCategorie.trim(),
        'item_name_en': itemsNameEn.trim(),
        'item_name_ar': itemsNameAr.trim(),
        'item_desc_en': itemDescEn.trim(),
        'item_desc_ar': itemDescAr.trim(),
        'item_discount': itemDiscount.trim(),
        'item_price': itemPrice.trim(),
        'item_count': itemCount.trim(),
        'item_colors': itemColors.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  deleteItem({
    required String img,
    required String itemId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.itemsDelete,
      data: {
        'item_image': img,
        'item_id': itemId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
