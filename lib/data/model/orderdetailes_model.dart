class OrdersDetailsModel {
  String? itemspriceDiscuont;
  String? countitem;
  String? cartId;
  String? cartUserid;
  String? cartItemsid;
  String? cartOrders;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDatetime;
  String? itemsCat;

  OrdersDetailsModel(
      {this.itemspriceDiscuont,
      this.countitem,
      this.cartId,
      this.cartUserid,
      this.cartItemsid,
      this.cartOrders,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDatetime,
      this.itemsCat});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    itemspriceDiscuont = json['itemspriceDiscuont'];
    countitem = json['countitem'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemspriceDiscuont'] = itemspriceDiscuont;
    data['countitem'] = countitem;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_itemsid'] = cartItemsid;
    data['cart_orders'] = cartOrders;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_datetime'] = itemsDatetime;
    data['items_cat'] = itemsCat;
    return data;
  }
}
