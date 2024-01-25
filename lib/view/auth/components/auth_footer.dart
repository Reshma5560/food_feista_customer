import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/app_style.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w * 1.5, vertical: defaultPadding.w),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 12.sp, fontFamily: AppStyle.fontFamilyName),
                children: <TextSpan>[
                  TextSpan(
                    text: 'By continuing, you are indicating that you agree to the ',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp, letterSpacing: .4, height: 1.7),
                  ),
                  // TextSpan(
                  //   text: 'Privacy Policy',
                  //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp, color: AppColors.blue, height: 1.7),
                  //   recognizer: TapGestureRecognizer()
                  //     ..onTap = () {
                  //       if (!isValEmpty(LocalStorage.privacyPolicyLink)) {
                  //         Get.to(
                  //           () => MyWebView(webURL: LocalStorage.privacyPolicyLink.value, title: "Privacy Policy"),
                  //         );
                  //       }
                  //     },
                  // ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp, letterSpacing: .4, height: 1.7),
                  ),
                  // TextSpan(
                  //   text: 'Terms',
                  //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp, color: AppColors.blue, height: 1.7),
                  //   recognizer: TapGestureRecognizer()
                  //     ..onTap = () {
                  //       if (!isValEmpty(LocalStorage.termsAndConditionsLink)) {
                  //         Get.to(
                  //           () => MyWebView(webURL: LocalStorage.termsAndConditionsLink.value, title: "Term and conditions"),
                  //         );
                  //       }
                  //     },
                  // ),
                  TextSpan(
                    text: '.',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp, letterSpacing: .4, height: 1.7),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
