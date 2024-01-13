class AddressModel {
  String? addressId;
  String? addressName;
  String? addressUserid;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  AddressModel(
      {this.addressId,
      this.addressName,
      this.addressUserid,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressUserid = json['address_userid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['address_name'] = addressName;
    data['address_userid'] = addressUserid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
