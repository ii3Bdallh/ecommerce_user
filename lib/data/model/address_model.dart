class AddressModel {
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

  AddressModel(
      {this.addressId,
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

  AddressModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
