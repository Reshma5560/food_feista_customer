import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_loader.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:get/get.dart';

import '../../controller/get_city_controller.dart';
import '../../data/models/get_city_model.dart';
import '../../repositories/auth_repositories.dart';
import '../../res/ui_utils.dart';
import '../../route/app_routes.dart';
import '../../utils/local_storage.dart';
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
        resizeToAvoidBottomInset: false,
        body: GradientContainer(
          child: Obx(
            () => con.isLoading.isTrue
                ? const AppLoader()
                : Column(
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
                                    () => ListView(
                                      padding: EdgeInsets.all(defaultPadding.w),
                                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                                      physics: const RangeMaintainingScrollPhysics(),
                                      children: [
                                        SizedBox(
                                          height: double.parse(
                                            value.toString(),
                                          ),
                                        ),
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
                                        TypeAheadField(
                                          suggestionsCallback: (text) {
                                            // log("00000");
                                            String searchText = con.cityTextController.value.text.trim();
                                            // log("searchText 0 $searchText");
                                            return con.getSearchTextListFunction(searchText);
                                          },
                                          textFieldConfiguration: TextFieldConfiguration(
                                            controller: con.cityTextController.value,
                                            onChanged: (value) async {
                                              await AuthRepository().getSearchCityListOnlyCall(searchText: con.cityTextController.value.text);
                                              con.isLoading(true);
                                              con.isLoading(false);
                                            },
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                // Set the border for the TextField
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              hintText: 'Select City...',
                                              suffixIcon: con.cityTextController.value.text == ""
                                                  ? null
                                                  : IconButton(
                                                      icon: const Icon(Icons.close),
                                                      color: Colors.grey,
                                                      iconSize: 20,
                                                      onPressed: () async {
                                                        con.cityTextController.value.clear();
                                                        await AuthRepository()
                                                            .getSearchCityListOnlyCall(searchText: con.cityTextController.value.text);
                                                        con.isLoading(true);
                                                        con.isLoading(false);
                                                      },
                                                    ),
                                            ),
                                          ),
                                          itemBuilder: (context, suggestion) {
                                            final cat = suggestion! as City;
                                            log("cat.cityName ${cat.cityName}");
                                            return ListTile(
                                              title: Text(cat.cityName.toString()),
                                            );
                                          },
                                          onSuggestionSelected: (suggestion) async {
                                            // log("text");
                                            City selectedCity = suggestion as City;
                                            con.cityTextController.value.text = selectedCity.cityName.toString();
                                            con.cityId.value = selectedCity.id.toString();
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        Obx(
                                          () => TweenAnimationBuilder(
                                            duration: const Duration(milliseconds: 1000),
                                            curve: Curves.elasticOut,
                                            tween: con.buttonPress.value ? Tween(begin: 0.9, end: 0.97) : Tween(begin: 1.0, end: 1.0),
                                            builder: (context, value, child) {
                                              return Transform.scale(
                                                scale: value,
                                                child: Obx(
                                                  () => AppButton(
                                                    title: "Find food".toUpperCase(),
                                                    loader: con.isLoading.value,
                                                    onHighlightChanged: (press) {
                                                      con.buttonPress.value = press;
                                                    },
                                                    onPressed: () async {
                                                      if (con.isLoading.isFalse) {
                                                        FocusScope.of(context).unfocus();

                                                        /// Set User Token
                                                        await LocalStorage.setCity(city: con.cityId.value);

                                                        Get.offAllNamed(AppRoutes.indexScreen);
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
      ),
    );
  }
}
