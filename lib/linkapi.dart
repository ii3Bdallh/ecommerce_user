class AppLink {
  static const String server = "http://10.0.2.2/php_ecommerce_back";

  static const String imageststatic =
      "http://10.0.2.2/php_ecommerce_back/upload";
//========================== Image ============================
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";
// =============================================================

  static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/Auth/signup.php";
  static const String login = "$server/Auth/login.php";
  static const String verifycodessignup = "$server/Auth/veridycode.php";
  static const String resend = "$server/Auth/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/Auth/forgetpassword/cheakemail.php";
  static const String resetPassword =
      "$server/Auth/forgetpassword/ressetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/Auth/forgetpassword/verifycode.php";

// Home

  static const String homepage = "$server/home.php";
// items
  static const String items = "$server/items/items.php";
  static const String search = "$server/items/search.php";
  // favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavroite = "$server/favorite/delete.php";
  // Cart
  static const String cartcount = "$server/cart/count.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartremove = "$server/cart/remove.php";
  static const String cartview = "$server/cart/view.php";
  //Address
  static const String addressview = "$server/address/view.php";
  static const String addressadd = "$server/address/add.php";
  static const String addressdelete = "$server/address/delete.php";
  static const String addressedit = "$server/address/edit.php";
  // Coupon
  static const String checkcoupon = "$server/coupon/checkcoupon.php";
  // CheckOut
  static const String checkout = "$server/orders/checkout.php";
  // Orders
  static const String bindingorder = "$server/orders/binding.php";
  static const String archiveorder = "$server/orders/archive.php";
  static const String detailsorder = "$server/orders/details.php";
  static const String deleteorder = "$server/orders/delete.php";
  static const String ratingorders = "$server/ratting.php";
  // Notification
  static const String notification = "$server/notification.php";
  //Offers
  static const String offers = "$server/offer/offer.php";
}
