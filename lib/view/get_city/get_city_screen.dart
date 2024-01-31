import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:get/get.dart';

import '../../controller/get_city_controller].dart';
import '../../repositories/auth_repositories.dart';
import '../../res/app_text_field.dart';
import '../../res/ui_utils.dart';
import '../auth/components/auth_header.dart';
import '../gradient_container/gradient_container.dart';

class GetCityScreen extends StatelessWidget {
  GetCityScreen({super.key});

  final GetCityController con = Get.put(GetCityController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GradientContainer(
          child: Column(
            children: [
              const AuthHeader(),
              Expanded(
                child: Stack(
                  children: [
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOutCubic,
                      tween: Tween(begin: 20.0, end: 1.0),
                      builder: (context, value, child) {
                        return AnimatedOpacity(
                          opacity: value == 20 ? 0 : 1,
                          duration: const Duration(milliseconds: 700),
                          child: Obx(
                            () => con.isLoading.isTrue
                                ? const AppLoader()
                                : ListView(
                                    padding: EdgeInsets.all(defaultPadding.w),
                                    keyboardDismissBehavior:
                                        ScrollViewKeyboardDismissBehavior
                                            .onDrag,
                                    physics:
                                        const RangeMaintainingScrollPhysics(),
                                    children: [
                                      SizedBox(
                                          height:
                                              double.parse(value.toString())),
                                      Text(
                                        "Locate Me",
                                        style: AppStyle.authTitleStyle(),
                                      ),
                                      SizedBox(height: defaultPadding.w),
                                      Text(
                                        "ORDER FOOD FROM FAVOURITE RESTAURANTS NEAR YOU.",
                                        style: AppStyle.authSubtitleStyle(),
                                      ),
                                      const SizedBox(height: 10),
                                      AppTextField(
                                        titleText: "City",
                                        hintText: "Enter City Name",
                                        controller:
                                            con.cityTextController.value,
                                        errorMessage: con.cityError.value,
                                        showError: con.cityValidation.value,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          Future.delayed(const Duration(seconds: 2))
                                              .then((value) {
                                            AuthRepository()
                                                .getSearchCityListOnlyCall(
                                                    searchText: con
                                                        .cityTextController
                                                        .value
                                                        .text);
                                          });

                                          con.cityValidation.value = false;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      Obx(
                                        () => TweenAnimationBuilder(
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          curve: Curves.elasticOut,
                                          tween: con.buttonPress.value
                                              ? Tween(begin: 0.9, end: 0.97)
                                              : Tween(begin: 1.0, end: 1.0),
                                          builder: (context, value, child) {
                                            return Transform.scale(
                                              scale: value,
                                              child: Obx(
                                                () => AppButton(
                                                  title:
                                                      "Find food".toUpperCase(),
                                                  loader: con.isLoading.value,
                                                  onHighlightChanged: (press) {
                                                    con.buttonPress.value =
                                                        press;
                                                  },
                                                  onPressed: () {
                                                    if (con.isLoading.isFalse) {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                    }
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        );
                      },
                    ),
                    UiUtils.scrollGradient(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
