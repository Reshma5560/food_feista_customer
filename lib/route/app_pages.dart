import 'package:foodapplication/view/account/account_screen.dart';
import 'package:foodapplication/view/account/widgets/add_address_screen.dart';
import 'package:foodapplication/view/account/widgets/edit_account_screen.dart';
import 'package:foodapplication/view/account/widgets/location_screen.dart';
import 'package:foodapplication/view/account/widgets/manage_address_screen.dart';
import 'package:foodapplication/view/account/widgets/update_password.dart';
import 'package:foodapplication/view/auth/forgot_password_screen.dart';
import 'package:foodapplication/view/auth/login_screen.dart';
import 'package:foodapplication/view/auth/signup_screen.dart';
import 'package:foodapplication/view/index/widget/home_screen.dart';
import 'package:foodapplication/view/get_city/get_city_screen.dart';
import 'package:get/get.dart';

import '../view/account/widgets/about_us_screen.dart';
import '../view/account/widgets/contact_us_screen.dart';
import '../view/account/widgets/terms_conditions_screen.dart';
import '../view/account/widgets/wish_list_screen.dart';
import '../view/index/bottom_screen.dart';
import '../view/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
    ),
    // GetPage(
    //   name: AppRoutes.otpVerificationScreen,
    //   page: () => VerifyOtpScreen(),
    // ),
    GetPage(
      name: AppRoutes.registerScreen,
      page: () => SignUpScreen(),
    ),
     GetPage(
      name: AppRoutes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.aboutUsScreen,
      page: () => AboutUsScreen(),
    ),
    GetPage(
      name: AppRoutes.termsConditionsScreen,
      page: () => TermsConditionsScreen(),
    ),
    GetPage(
      name: AppRoutes.contactUsScreen,
      page: () => ContactUsScreen(),
    ),
    GetPage(
      name: AppRoutes.indexScreen,
      page: () => IndexScreen(),
    ),

    GetPage(
      name: AppRoutes.updatePasswordScreen,
      page: () => UpdatePasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.editAccountScreen,
      page: () => EditAccountScreen(),
    ),
    GetPage(
      name: AppRoutes.accountScreen,
      page: () => AccountScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
    ),

    GetPage(
      name: AppRoutes.manageAddressScreen,
      page: () => ManageAddressScreen(),
    ),
    GetPage(
      name: AppRoutes.addAddressScreen,
      page: () => AddAddressScreen(),
    ),
    GetPage(
      name: AppRoutes.locationScreen,
      page: () => LocationScreen(),
    ),
    GetPage(
      name: AppRoutes.wishListScreen,
      page: () => WishListScreen(),
    ),
     
     GetPage(
      name: AppRoutes.getCityScreen,
      page: () => GetCityScreen(),
    ),
  ];
}
