class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersCoupon;
  String? ordersDatetime;
  String? ordersPaymantmethod;
  String? ordersStatus;
  String? ordersTotalprice;
  String? addressId;
  String? addressUsersid;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? addressName;
  String? addressPhone;
  String? addressNote;
  String? addressHome;
  String? addressFloor;
  String? ordersRating;
  String? ordersNoterating;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordersDatetime,
      this.ordersPaymantmethod,
      this.ordersStatus,
      this.ordersTotalprice,
      this.ordersRating,
      this.ordersNoterating,
      this.addressId,
      this.addressUsersid,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong,
      this.addressName,
      this.addressPhone,
      this.addressNote,
      this.addressHome,
      this.addressFloor});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'].toString();
    ordersUsersid = json['orders_usersid'].toString();
    ordersAddress = json['orders_address'].toString();
    ordersType = json['orders_type'].toString();
    ordersPricedelivery = json['orders_pricedelivery'].toString();
    ordersPrice = json['orders_price'].toString();
    ordersCoupon = json['orders_coupon'].toString();
    ordersDatetime = json['orders_datetime'];
    ordersPaymantmethod = json['orders_paymantmethod'].toString();
    ordersStatus = json['orders_status'].toString();
    ordersTotalprice = json['orders_totalprice'].toString();
        ordersRating = json['orders_rating'].toString();
    ordersNoterating = json['orders_noterating'];
    addressId = json['address_id'].toString();
    addressUsersid = json['address_usersid'].toString();
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'].toString();
    addressLong = json['address_long'].toString();
    addressName = json['address_name'];
    addressPhone = json['address_phone'].toString();
    addressNote = json['address_note'];
    addressHome = json['address_home'];
    addressFloor = json['address_floor'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_datetime'] = ordersDatetime;
    data['orders_paymantmethod'] = ordersPaymantmethod;
    data['orders_status'] = ordersStatus;
    data['orders_totalprice'] = ordersTotalprice;
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_name'] = addressName;
    data['address_phone'] = addressPhone;
    data['address_note'] = addressNote;
    data['address_home'] = addressHome;
    data['address_floor'] = addressFloor;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    return data;
  }
}
