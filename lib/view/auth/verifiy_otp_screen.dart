// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:pinput/pinput.dart';
//
// import '../../controller/auth/login_controller.dart';
// import '../../controller/auth/verify_otp_controller.dart';
// import '../../packages/animated_counter/animated_counter.dart';
// import '../../res/app_button.dart';
// import '../../res/app_colors.dart';
// import '../../res/app_strings.dart';
// import '../../res/app_style.dart';
// import '../../res/ui_utils.dart';
// import '../gradient_container/gradient_container.dart';
// import 'components/auth_header.dart';
//
// class VerifyOtpScreen extends StatelessWidget {
//   VerifyOtpScreen({super.key});
//
//   final VerifyOtpController con = Get.put(VerifyOtpController());
//   final LoginController loginCon = Get.find<LoginController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//       child: Scaffold(
//         body: GradientContainer(
//           child: Column(
//             children: [
//               const AuthHeader(),
//               Expanded(
//                 child: Stack(
//                   children: [
//                     TweenAnimationBuilder(
//                       duration: const Duration(milliseconds: 1000),
//                       curve: Curves.easeOutCubic,
//                       tween: Tween(begin: 20.0, end: 1.0),
//                       builder: (context, value, child) {
//                         return Obx(
//                           () => AnimatedOpacity(
//                             opacity: value == 20 ? 0 : 1,
//                             duration: const Duration(milliseconds: 700),
//                             child: ListView(
//                               padding: EdgeInsets.all(defaultPadding.w),
//                               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//                               physics: const RangeMaintainingScrollPhysics(),
//                               children: [
//                                 SizedBox(height: double.parse(value.toString())),
//                                 Text(
//                                   "OTP\nVerification",
//                                   // style: AppStyle.authTitleStyle(),
//                                   style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//                                         color: Theme.of(context).primaryColor,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                 ),
//                                 SizedBox(height: defaultPadding.w),
//                                 RichText(
//                                   text: TextSpan(
//                                     style: TextStyle(color: Colors.black, fontSize: 12.sp, fontFamily: AppStyle.fontFamilyName),
//                                     children: [
//                                       TextSpan(
//                                         text: 'Enter the OTP sent to ',
//                                         style: AppStyle.authSubtitleStyle(),
//                                       ),
//                                       TextSpan(
//                                         recognizer: TapGestureRecognizer()..onTap = editMobileNumber,
//                                         text: '${AppStrings.indiaCountryCode} ${loginCon.mobileNumberCon.value.text}',
//                                         style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.blue, fontSize: 12.sp),
//                                       ),
//                                       WidgetSpan(
//                                         child: GestureDetector(
//                                           onTap: editMobileNumber,
//                                           child: Padding(
//                                             padding: EdgeInsets.only(left: 4.sp, bottom: 2),
//                                             child: Icon(
//                                               Icons.edit,
//                                               color: Theme.of(context).primaryColor,
//                                               size: 13.sp,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: defaultPadding.w * 2),
//                                 Center(
//                                   child: Pinput(
//                                     length: 6,
//                                     controller: con.otpController.value,
//                                     focusNode: con.otpFocus,
//                                     autofocus: true,
//                                     enabled: !con.isResendOtp.value,
//                                     defaultPinTheme: defaultPinTheme,
//                                     cursor: Container(width: 2, height: 20, color: Theme.of(context).primaryColor),
//                                     inputFormatters: [
//                                       FilteringTextInputFormatter.digitsOnly,
//                                       LengthLimitingTextInputFormatter(6),
//                                     ],
//                                     focusedPinTheme: defaultPinTheme.copyWith(
//                                       decoration: defaultPinTheme.decoration!.copyWith(border: Border.all(color: Theme.of(context).primaryColor)),
//                                     ),
//                                     errorPinTheme: defaultPinTheme.copyWith(
//                                       decoration: BoxDecoration(color: Theme.of(context).colorScheme.error),
//                                     ),
//                                     errorBuilder: (errorText, pin) {
//                                       return Text(errorText.toString());
//                                     },
//                                     onClipboardFound: (value) {
//                                       if (value is int) {
//                                         con.otpController.value.setText(value);
//                                       }
//                                     },
//                                     onCompleted: (pin) {
//                                       con.otpValid.value = false;
//                                       con.codeError.value = '';
//                                       // con.checkOTP(isLoader: con.isResendOtp);
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(height: defaultPadding.w),
//                                 AppButton(
//                                   title: "VERIFY OTP",
//                                   loader: con.isResendOtp.value,
//                                   onPressed: () {
//                                     if (con.validation().isTrue) {
//                                       // con.checkOTP(isLoader: con.isResendOtp);
//                                     }
//                                   },
//                                 ),
//                                 SizedBox(height: defaultPadding.w),
//                                 con.isTimerComplete.isTrue
//                                     ? Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             AppStrings.resendOtp,
//                                             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
//                                           ),
//                                           GestureDetector(
//                                             onTap: () {
//                                               if (con.isResendOtp.isFalse) {
//                                                 // con.reSentOTP(
//                                                 //     mobileNumber: int.parse(loginCon.mobileNumberCon.value.text.trim()), isLoader: con.isResendOtp);
//                                               } else {
//                                                 toast(AppStrings.pleaseWait);
//                                               }
//                                             },
//                                             child: Text(
//                                               AppStrings.resendText,
//                                               style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.blue, fontSize: 12.sp),
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     : Align(
//                                         alignment: Alignment.center,
//                                         child: RichText(
//                                           textAlign: TextAlign.center,
//                                           text: TextSpan(
//                                             style: TextStyle(color: Colors.black, fontSize: 13.sp, fontFamily: AppStyle.fontFamilyName),
//                                             children: [
//                                               TextSpan(
//                                                 text: 'Resend Code in ',
//                                                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
//                                               ),
//                                               WidgetSpan(
//                                                 child: AnimatedFlipCounter(
//                                                   value: con.timeLimit / 60 + con.timeLimit % 60,
//                                                   wholeDigits: 2,
//                                                   prefix: "00:",
//                                                   textStyle: TextStyle(fontWeight: FontWeight.w600, color: AppColors.blue, fontSize: 12.sp),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     UiUtils.scrollGradient(context),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // bottomNavigationBar: const AuthFooter(),
//       ),
//     );
//   }
//
//   VoidCallback get editMobileNumber {
//     return () {
//       Get.back();
//       Get.back();
//     };
//   }
//
//   PinTheme get defaultPinTheme {
//     return PinTheme(
//       width: 40.w,
//       height: 40.w,
//       margin: EdgeInsets.symmetric(vertical: defaultPadding.w, horizontal: 2.w),
//       textStyle: const TextStyle(height: 1, fontSize: 20, fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         border: Border.all(color: con.codeError.isEmpty ? AppColors.lightRed : Colors.red),
//       ),
//     );
//   }
// }
