import 'package:flutter/material.dart';
import 'package:foodapplication/controller/account/components/about_us_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:get/get.dart';

import '../../../res/app_colors.dart';
import '../../../res/widgets/app_bar.dart';

class TermsConditionsScreen extends StatelessWidget {
  TermsConditionsScreen({super.key});

  final AboutUsController con = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCubic,
        tween: Tween(begin: 20.0, end: 1.0),
        builder: (context, value, child) {
          return AnimatedOpacity(
            opacity: value == 20 ? 0 : 1,
            duration: const Duration(milliseconds: 700),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(defaultRadius * 3),
                    bottomRight: Radius.circular(defaultRadius * 3),
                  ),
                  child: MyAppBar(
                    bgColor: Theme.of(context).colorScheme.background,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {},
                    ),
                    title: "Terms & Conditions",
                    centerTitle: true,
                    titleStyle: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black),
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: const RangeMaintainingScrollPhysics(),
                    children: [
                      Center(
                        child: Image.asset(
                          AppAssets.appLogo,
                          width: Get.width / 2,
                        ),
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Text(
                          '''1. Acceptance of Terms

By using [Your Food App Name], you agree to comply with and be bound by the following terms and conditions. If you do not agree with any part of these terms, please refrain from using our app.

2. User Eligibility

You must be at least 18 years old to use [Your Food App Name]. By using the app, you confirm that you meet this eligibility requirement.

3. Account Information

You are responsible for maintaining the confidentiality of your account information. Any activity that occurs under your account is your responsibility. Notify us immediately of any unauthorized use or security breach.

4. Ordering and Transactions

a. [Your Food App Name] facilitates the ordering process between users and restaurants. We are not responsible for the quality, accuracy, or timeliness of the products or services provided by the restaurants.

b. Payment transactions are securely processed through our platform. [Your Food App Name] is not responsible for any issues related to payment, including but not limited to unauthorized transactions.

5. Content and Intellectual Property

a. Users are prohibited from reproducing, distributing, or using any content from [Your Food App Name] without explicit permission.

b. All intellectual property rights related to the app and its content are owned by [Your Food App Name].

6. User Conduct

Users agree not to engage in any behavior that may disrupt the app's functionality, compromise security, or violate any applicable laws.

7. Privacy Policy

Our Privacy Policy outlines how we collect, use, and share your personal information. By using [Your Food App Name], you agree to the terms outlined in our Privacy Policy.

8. Termination of Service

[Your Food App Name] reserves the right to terminate or suspend your account at any time without notice if you violate these terms and conditions.

9. Changes to Terms

[Your Food App Name] may update these terms and conditions at any time. It is your responsibility to review them periodically for changes.

10. Contact Information

For questions or concerns about these terms and conditions, please contact us at [Your Contact Email].

[Your Food App Name] - Bringing Flavor to Your Fingertips!''',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
