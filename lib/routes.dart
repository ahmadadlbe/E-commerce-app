import 'package:get/get.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/middleware/mymiddleware.dart';
import 'package:store_app/view/screen/address/add_screen.dart';
import 'package:store_app/view/screen/address/addtwo_screen.dart';
import 'package:store_app/view/screen/address/delete_screen.dart';
import 'package:store_app/view/screen/address/edite_screen.dart';
import 'package:store_app/view/screen/address/view_screen.dart';
import 'package:store_app/view/screen/auth/forgetpasswrd/checkemail_screen.dart';
import 'package:store_app/view/screen/auth/forgetpasswrd/forgetpassword_screen.dart';
import 'package:store_app/view/screen/auth/languagechose.dart';
import 'package:store_app/view/screen/auth/login.dart';
import 'package:store_app/view/screen/auth/forgetpasswrd/resetpassword_screen.dart';
import 'package:store_app/view/screen/auth/singup_screen.dart';
import 'package:store_app/view/screen/auth/forgetpasswrd/succses_resetpassword_screen.dart';
import 'package:store_app/view/screen/auth/forgetpasswrd/verifycode_screen.dart';
import 'package:store_app/view/screen/auth/successsingup_screen.dart';
import 'package:store_app/view/screen/auth/verifycodesignup_screen.dart';
import 'package:store_app/view/screen/cart_screen.dart';
import 'package:store_app/view/screen/order/checkout_screen.dart';
import 'package:store_app/view/screen/favorite_screen.dart';
import 'package:store_app/view/screen/homebarscreen.dart';
import 'package:store_app/view/screen/items_screen.dart';
import 'package:store_app/view/screen/itemsdetils_screen.dart';
import 'package:store_app/view/screen/onboarder_screen.dart';
import 'package:store_app/view/screen/order/orderdetils_screen.dart';
import 'package:store_app/view/screen/order/pending_screen.dart';

import 'view/screen/order/archive_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const LanguageScreen(),
      middlewares: [MyMiddlewaer()]),
  GetPage(name: AppRoutes.loginroutes, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.singuproutes, page: () => const SingUp()),
  GetPage(
      name: AppRoutes.forgetPasswrdroutes,
      page: () => const ForgetPasswordScreen()),
  GetPage(
      name: AppRoutes.checkemailroutes, page: () => const CheckEmailScreen()),
  GetPage(
      name: AppRoutes.verifyCoderoutes, page: () => const VerifyCodeScreen()),
  GetPage(
      name: AppRoutes.verifyCodesignuproutes,
      page: () => const VerifyCodeSignUpScreen()),
  GetPage(
      name: AppRoutes.resetPasswordroutes,
      page: () => const ResetPasswordScreen()),
  GetPage(
      name: AppRoutes.succsesPasswordroutes,
      page: () => const SuccsesResetPasswordScreen()),
  GetPage(
      name: AppRoutes.succsessignuproutes,
      page: () => const SuccessSignUpScreen()),
  // on boarding
  GetPage(
      name: AppRoutes.onboardingroutes, page: () => const OnboardeingScreen()),
  // homepage
  GetPage(name: AppRoutes.homepageroutes, page: () => HomeBarScreen()),
  GetPage(name: AppRoutes.itemsroutes, page: () => const ItemsScreen()),
  GetPage(name: AppRoutes.iditelsroutes, page: () => const ItemsDetilsScreen()),
  GetPage(name: AppRoutes.favoriterouts, page: () => const FavoriteScreen()),
  GetPage(name: AppRoutes.cartrouts, page: () => const CartScreen()),
  GetPage(name: AppRoutes.checkOutrouts, page: () => const CheckOutScreen()),
  //address
  GetPage(
      name: AppRoutes.addressViewrouts, page: () => const ViewAddressScreen()),
  GetPage(
      name: AppRoutes.addressAddTworouts,
      page: () => const AddAddressTwoScreen()),
  GetPage(
      name: AppRoutes.addressAddrouts, page: () => const AddAddressScreen()),
  GetPage(
      name: AppRoutes.addressDeleterouts,
      page: () => const DeleteAddressScreen()),
  GetPage(
      name: AppRoutes.addressEditerouts,
      page: () => const EditeAddressScreen()),
  GetPage(name: AppRoutes.pendingrouts, page: () => const PendingScreen()),
  GetPage(name: AppRoutes.archiverouts, page: () => const ArchiveScreen()),
  GetPage(name: AppRoutes.orderdetails, page: () => const OrderDetailsScreen()),
];
