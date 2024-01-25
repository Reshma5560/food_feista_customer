import 'package:foodapplication/view/auth/login_screen.dart';
import 'package:foodapplication/view/auth/signup_screen.dart';
import 'package:foodapplication/view/auth/verifiy_otp_screen.dart';
import 'package:get/get.dart';

import '../view/account/widgets/about_us_screen.dart';
import '../view/account/widgets/terms_conditions_screen.dart';
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
    GetPage(
      name: AppRoutes.otpVerificationScreen,
      page: () => VerifyOtpScreen(),
    ),
    GetPage(
      name: AppRoutes.registerScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.aboutUsScreen,
      page: () => AboutUsScreen(),
    ),
    GetPage(
      name: AppRoutes.termsConditionsScreen,
      page: () => TermsConditionsScreen(),
    ),
  ];
}
