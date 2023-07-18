class OrderModel {
  int? orderId;
  int? orderUserid;
  String? orderPaymentmethod;
  String? orderStatus;
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
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    orderUserid = json['order_userid'];
    orderPaymentmethod = json['order_paymentmethod'];
    orderItemscount = int.parse(json['order_itemscount'].toString());
    orderPrice = double.parse((json['order_price'] ?? 0).toString());
    orderCreateddate = json['order_createddate'];
    addressId = json['address_id'];
    addressCity = json['address_city'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
    addressLat = double.parse(json['address_lat'].toString());
    addressLong = double.parse(json['address_long'].toString());
    addressPhonenumber = json['address_phonenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_status'] = orderStatus;
    data['order_userid'] = orderUserid;
    data['order_paymentmethod'] = orderPaymentmethod;
    data['order_createddate'] = orderCreateddate;
    data['order_itemscount'] = orderItemscount;
    data['address_id'] = addressId;
    data['address_city'] = addressCity;
    data['address_name'] = addressName;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_phonenumber'] = addressPhonenumber;
    return data;
  }
}
