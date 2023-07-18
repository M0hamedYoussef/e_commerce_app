import 'package:e_commerce_admin/core/functions/replace.dart';

class ItemsModel {
  int? itemId;
  int? itemCategorie;
  String? itemImage;
  String? itemNameEn;
  String? itemNameAr;
  String? itemDescEn;
  String? itemDescAr;
  double? itemDiscount;
  double? itemPrice;
  int? itemCount;
  String? itemColors;
  int? itemActive;
  String? itemCreatedDate;

  ItemsModel({
    this.itemId,
    this.itemCategorie,
    this.itemImage,
    this.itemNameEn,
    this.itemNameAr,
    this.itemDescEn,
    this.itemDescAr,
    this.itemDiscount,
    this.itemPrice,
    this.itemCount,
    this.itemColors,
    this.itemActive,
    this.itemCreatedDate,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemCategorie = json['item_categorie'];
    itemImage = json['item_image'];
    itemNameEn = json['item_name_en'];
    itemNameAr = json['item_name_ar'];
    itemDescEn = json['item_desc_en'];
    itemDescAr = json['item_desc_ar'];
    itemDiscount = double.parse((json['item_discount'] ?? 0).toString());
    itemPrice = double.parse((json['item_price'] ?? 0).toString());
    itemCount = json['item_count'];
    itemColors = json['item_colors'];
    itemActive = json['item_active'];
    itemCreatedDate = json['item_created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_categorie'] = itemCategorie;
    data['item_image'] = itemImage;
    data['item_name_en'] = itemNameEn;
    data['item_name_ar'] = itemNameAr;
    data['item_desc_en'] = itemDescEn;
    data['item_desc_ar'] = itemDescAr;
    data['item_discount'] = itemDiscount;
    data['item_price'] = itemPrice;
    data['item_count'] = itemCount;
    data['item_colors'] = replace(
      text: itemColors.toString(),
      replace: {
        '[': '',
        ']': '',
      },
    );
    data['item_active'] = itemActive;
    data['item_created_date'] = itemCreatedDate;
    return data;
  }
}
