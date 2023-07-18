class CouponsModel {
  int? couponId;
  String? coupon;
  double? couponDiscount;

  CouponsModel({this.couponId, this.coupon, this.couponDiscount});

  CouponsModel.fromJson(Map<String, dynamic> json) {
    couponId = json['couponId'] == null
        ? 0
        : int.parse(
            json['couponId'].toString(),
          );

    coupon = json['coupon'].toString().trim().toLowerCase();

    couponDiscount = json['coupon_discount'] == null
        ? 0
        : double.parse(
            json['coupon_discount'].toString(),
          );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = couponId;
    data['coupon'] = coupon;
    data['coupon_discount'] = couponDiscount;
    return data;
  }
}
