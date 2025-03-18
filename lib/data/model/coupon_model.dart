class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDiscount;
  String? couponExpire;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.couponExpire});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'].toString();
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'].toString();
    couponDiscount = json['coupon_discount'].toString();
    couponExpire = json['coupon_expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_count'] = couponCount;
    data['coupon_discount'] = couponDiscount;
    data['coupon_expire'] = couponExpire;
    return data;
  }
}
