class OrdersModel {
  String? ordersId;
  String? ordersUserid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPaymentmethod;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersRating;
  String? ordersNoterating;
  String? ordersStatus;
  String? ordersDatetime;
  String? addressId;
  String? addressName;
  String? addressUserid;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPaymentmethod,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersRating,
      this.ordersNoterating,
      this.ordersStatus,
      this.ordersDatetime,
      this.addressId,
      this.addressName,
      this.addressUserid,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
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
    data['orders_id'] = ordersId;
    data['orders_userid'] = ordersUserid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['orders_status'] = ordersStatus;
    data['orders_datetime'] = ordersDatetime;
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
