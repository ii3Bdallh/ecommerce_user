import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/core/middleware/mymiddleware.dart';
import 'package:ecommere_user/view/screen/address/add_address.dart';
import 'package:ecommere_user/view/screen/address/add_address_details.dart';
import 'package:ecommere_user/view/screen/address/view_address.dart';
import 'package:ecommere_user/view/screen/orders/archive.dart';
import 'package:ecommere_user/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommere_user/view/screen/auth/login.dart';
import 'package:ecommere_user/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommere_user/view/screen/auth/signup.dart';
import 'package:ecommere_user/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommere_user/view/screen/auth/success_signup.dart';
import 'package:ecommere_user/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommere_user/view/screen/auth/verifycodesignup.dart';
import 'package:ecommere_user/view/screen/orders/bending.dart';
import 'package:ecommere_user/view/screen/cart.dart';
import 'package:ecommere_user/view/screen/checkout.dart';
import 'package:ecommere_user/view/screen/homescreen.dart';
import 'package:ecommere_user/view/screen/items.dart';
import 'package:ecommere_user/view/screen/language.dart';
import 'package:ecommere_user/view/screen/myfavorite.dart';
import 'package:ecommere_user/view/screen/onboarding.dart';
import 'package:ecommere_user/view/screen/orders/ordertracking.dart';
import 'package:ecommere_user/view/screen/ordersdetails.dart';
import 'package:ecommere_user/view/screen/productdetails.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: "/", page: () => const TestView()),
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddAddressDetails()),
  GetPage(name: AppRoute.checkout, page: () => const CheckOut()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.myCart, page: () => const Cart()),
  GetPage(name: AppRoute.addressview, page: () => const ViewwAddress()),
  GetPage(name: AppRoute.addressadd, page: () => const AddAddress()),
  GetPage(name: AppRoute.checkout, page: () => const CheckOut()),
  GetPage(name: AppRoute.orderaarchive, page: () => const ArchiveOrders()),
  GetPage(name: AppRoute.orderabinding, page: () => const BendingOrders()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.tracking, page: () => const TrackingOrdersScreen()),
];
