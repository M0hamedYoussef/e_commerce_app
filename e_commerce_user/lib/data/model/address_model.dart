class AddressModel {
  int? addressId;
  int? addressUserid;
  String? userPhonenumber;
  double? addressLat;
  double? addressLong;
  String? addressCity;
  String? addressName;
  String? addressStreet;

  AddressModel({
    this.addressId,
    this.addressUserid,
    this.addressCity,
    this.addressName,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.userPhonenumber,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'] == null
        ? 0
        : int.parse(json['address_id'].toString());
    addressUserid = json['address_userid'] == null
        ? 0
        : int.parse(json['address_userid'].toString());

    userPhonenumber = json['address_phonenumber'].toString();

    addressLat = json['address_lat'] == null
        ? 0
        : double.parse(json['address_lat'].toString());
    addressLong = json['address_long'] == null
        ? 0
        : double.parse(json['address_long'].toString());
    addressCity = json['address_city'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_city'] = addressCity;
    data['address_name'] = addressName;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_phonenumber'] = userPhonenumber;
    return data;
  }
}
