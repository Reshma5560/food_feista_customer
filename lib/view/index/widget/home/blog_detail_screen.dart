import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controller/blog_detail_controller.dart';
import '../../../../packages/cached_network_image/cached_network_image.dart';
import '../../../../res/app_assets.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/app_style.dart';

class BlogDetailScreen extends StatelessWidget {
  BlogDetailScreen({super.key});

  final BlogDetailController con = Get.put(BlogDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppAssets.appbarBgImage, fit: BoxFit.fill, width: Get.width),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    // color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  "Blog",
                  style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                ),
                Text(
                  "Restaurant",
                  style: AppStyle.customAppBarTitleStyle().copyWith(color: Colors.transparent, fontSize: 16.sp),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.1),
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                          child: MFNetworkImage(
                            backgroundColor: AppColors.white,
                            imageUrl: con.blogData.value.image ?? "",
                            fit: BoxFit.cover,
                            height: 230,
                            width: Get.width,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        Positioned(
                          bottom: -50,
                          left: defaultPadding * 2,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(
                                defaultRadius,
                              ),
                              boxShadow: AppStyle.boxShadow(),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "The\nEvent",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.sp, fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  DateFormat("dd MMM").format(con.blogData.value.createdAt ?? DateTime.now()),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: AppColors.black, fontSize: 16.sp, fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding).copyWith(top: Get.height * 0.08),
                      child: Text(
                        con.blogData.value.blogName ?? "",
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Html(
                        data: con.blogData.value.content,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
