import 'package:e_commerce_admin/core/functions/replace.dart';
import 'package:get/get.dart';

class OrderModel {
  int? orderId;
  String? orderCoupon;
  String? orderStatus;
  String? orderDate;
  double? orderRate;
  String? orderReview;
  int? orderUserid;
  String? orderPaymentmethod;
  String? orderCreateddate;
  int? orderItemscount;
  double? orderPrice;
  int? addressId;
  String? addressCity;
  String? addressName;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressPhonenumber;
  String? coupon;
  int? couponDiscount;
  int? cartId;
  int? cartItemid;
  String? cartItemcolor;
  int? cartItemcount;
  int? cartUserid;
  int? itemId;
  double? itemRate;
  int? itemCategorie;
  String? itemImage;
  String? itemNameEn;
  String? itemNameAr;
  String? itemDescEn;
  String? itemDescAr;
  int? itemCount;
  int? itemActive;
  String? itemCreatedDate;
  int? categorieId;
  String? categorieImage;
  String? categorieNameEn;
  String? categorieNameAr;
  String? categorieCreatedDate;
  List? itemColors;
  String? selectedColor;
  double? itemPrice;
  int? itemDiscount;
  double? priceWithDiscount;

  OrderModel({
    this.orderId,
    this.orderStatus,
    this.orderUserid,
    this.orderPaymentmethod,
    this.orderCreateddate,
    this.addressId,
    this.addressCity,
    this.addressName,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressPhonenumber,
    this.orderPrice,
    this.orderCoupon,
    this.orderDate,
    this.orderRate,
    this.orderReview,
    this.coupon,
    this.couponDiscount,
    this.cartId,
    this.cartItemid,
    this.cartItemcolor,
    this.cartItemcount,
    this.cartUserid,
    this.itemId,
    this.itemRate,
    this.itemCategorie,
    this.itemImage,
    this.itemNameEn,
    this.itemNameAr,
    this.itemDescEn,
    this.itemDescAr,
    this.itemDiscount,
    this.itemPrice,
    this.itemCount,
    this.itemActive,
    this.itemCreatedDate,
    this.categorieId,
    this.categorieImage,
    this.categorieNameEn,
    this.categorieNameAr,
    this.categorieCreatedDate,
    this.itemColors,
    this.priceWithDiscount,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    orderUserid = json['order_userid'];
    orderPaymentmethod = json['order_paymentmethod'];
    orderPrice = double.parse((json['order_price'] ?? 0).toString());
    orderCreateddate = json['order_createddate'];
    addressId = json['address_id'];
    addressCity = json['address_city'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressPhonenumber = json['address_phonenumber'];
    orderCoupon = json['order_coupon'];
    orderDate = json['order_createddate'];
    orderRate = double.parse((json['order_rate'] ?? 0).toString());
    orderReview = json['order_review'];
    addressId = json['order_addressid'];
    coupon = json['order_coupon'];
    couponDiscount = json['coupon_discount'];
    cartId = json['cart_id'];
    cartItemid = json['cart_itemid'] ?? json['item_id'];
    cartItemcolor = ((json['cart_itemcolor'] ?? 'default').toString().isEmpty
            ? 'default'
            : json['cart_itemcolor'])
        .toString()
        .capitalizeFirst;
    cartItemcount = json['cart_itemcount'];
    cartUserid = json['cart_userid'];
    itemColors = json['item_colors'].toString().split(',');
    itemId = json['item_id'];
    itemRate = double.parse((json['item_rate'] ?? 0).toString());
    itemCategorie = json['item_categorie'];
    itemImage = json['item_image'];
    itemNameEn = json['item_name_en'];
    itemNameAr = json['item_name_ar'];
    itemDescEn = json['item_desc_en'];
    itemDescAr = json['item_desc_ar'];
    itemDiscount = json['item_discount'];
    itemPrice = double.parse(json['item_price'].toString());
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemCreatedDate = json['item_created_date'];
    categorieId = json['categorie_id'];
    categorieImage = json['categorie_image'];
    categorieNameEn = json['categorie_name_en'];
    categorieNameAr = json['categorie_name_ar'];
    categorieCreatedDate = json['categorie_created_date'];
    selectedColor = 'default';
    priceWithDiscount =
        (itemPrice! - (itemPrice! * ((itemDiscount ?? 0) / 100)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_status'] = orderStatus;
    data['order_coupon'] = orderCoupon;
    data['order_addressid'] = addressId;
    data['order_coupon'] = coupon;
    data['coupon_discount'] = couponDiscount;
    data['cart_id'] = cartId;
    data['cart_itemid'] = cartItemid;
    data['cart_itemcolor'] = cartItemcolor;
    data['cart_itemcount'] = cartItemcount;
    data['cart_userid'] = cartUserid;
    data['item_id'] = itemId;
    data['item_colors'] = replace(
      text: itemColors.toString(),
      replace: {
        '[': '',
        ']': '',
      },
    );
    data['item_categorie'] = itemCategorie;
    data['item_image'] = itemImage;
    data['item_name_en'] = itemNameEn;
    data['item_name_ar'] = itemNameAr;
    data['item_desc_en'] = itemDescEn;
    data['item_desc_ar'] = itemDescAr;
    data['item_discount'] = itemDiscount;
    data['item_price'] = itemPrice;
    data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_created_date'] = itemCreatedDate;
    data['categorie_id'] = categorieId;
    data['categorie_image'] = categorieImage;
    data['categorie_name_en'] = categorieNameEn;
    data['categorie_name_ar'] = categorieNameAr;
    data['categorie_created_date'] = categorieCreatedDate;

    return data;
  }
}
