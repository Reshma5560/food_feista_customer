import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/auth/cms_controller.dart';
import 'package:foodapplication/res/app_assets.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:get/get.dart';

import '../../../res/app_appbar.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

  final CmsController con = Get.find<CmsController>();

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
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.appbarBgImage,
                  fit: BoxFit.fill,
                  width: Get.width,
                  height: Get.height,
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 16.sp,
                          // color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Text(
                        "About Us",
                        style: AppStyle.customAppBarTitleStyle()
                            .copyWith(color: AppColors.black, fontSize: 16.sp),
                      ),
                      const Text("Aboutus",
                          style: TextStyle(color: Colors.transparent)),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.1),
                    child: Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        physics: const RangeMaintainingScrollPhysics(),
                        children: [
                          // Center(
                          //   child: Image.asset(
                          //     AppAssets.appLogo,
                          //     width: Get.width / 2,
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: defaultPadding,
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: Html(
                              data: con.aboutUsData.value.body,
                            ), /*Text(
                                    '''🍽️ Welcome to [Your Food App Name], the ultimate destination for food enthusiasts and gastronomic explorers! 🌮
                                          
                                          Our Story
                                          
                                          Established in [Year of Establishment], [Your Food App Name] was born out of a shared passion for bringing people closer to exceptional food experiences. The idea sprouted from the belief that discovering and enjoying fantastic meals should be an effortless and enjoyable journey.
                                          
                                          Our Mission
                                          
                                          At [Your Food App Name], our mission is clear - to redefine the way you experience and appreciate food. We strive to create a platform that not only connects you with a diverse array of culinary delights but also enhances your overall dining adventure.
                                          
                                          Why Choose [Your Food App Name]?
                                          
                                          Curated Excellence: Our team of food enthusiasts meticulously curates a selection of restaurants, ensuring that every dish meets our high standards of quality and taste.
                                          
                                          User-Friendly Interface: We've designed [Your Food App Name] to be user-friendly, making it a breeze for you to explore menus, place orders, and embark on your gastronomic journey effortlessly.
                                          
                                          Community Spirit: Beyond being an app, [Your Food App Name] is a community. Share your favorite dishes, reviews, and culinary tips with like-minded foodies.
                                          
                                          Join Us in the Culinary Adventure!
                                          
                                          Whether you're a seasoned connoisseur or just starting your exploration, [Your Food App Name] is here to make every meal a memorable experience. Download our app now, embark on a journey of taste, and discover a world of culinary delights.
                                          
                                          📲 [Download Now] and let your food adventure begin!''',
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),*/
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
