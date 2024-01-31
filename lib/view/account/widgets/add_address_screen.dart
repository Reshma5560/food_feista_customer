import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapplication/controller/account/components/add_address_controller.dart';
import 'package:foodapplication/model/get_city_model.dart';
import 'package:foodapplication/model/get_country_model.dart';
// import 'package:foodapplication/model/get_address_model.dart';
import 'package:foodapplication/model/get_state_model.dart';
import 'package:foodapplication/repositories/auth_repositories.dart';
import 'package:foodapplication/res/app_appbar.dart';
import 'package:foodapplication/res/app_button.dart';
import 'package:foodapplication/res/app_colors.dart';
import 'package:foodapplication/res/app_style.dart';
import 'package:foodapplication/res/app_text_field.dart';
import 'package:get/get.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});

  final AddAddressController con = Get.put(AddAddressController());
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
                  child: Column(children: [
                    CommonAppBar(
                      title: "Add Address",
                      onPressed: () {
                        //   Get.back();
                        // Get.back();
                        Get.offNamedUntil('/MANAGE_ADDRESS_SCREEN',
                            (Route<dynamic> route) => route.isFirst);
                      },
                    ),
                    Expanded(
                        child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        _floorHouseModule(),
                        SizedBox(height: 10.w),
                        _addressModule(),
                        SizedBox(height: 10.w),
                        Text(
                          "Address Type",
                          style: AppStyle.textFieldTitleStyle(),
                        ).paddingOnly(bottom: 10),
                        _addressType(),
                        SizedBox(height: 10.w),
                        _receiverNameModule(),
                        SizedBox(height: 10.w),
                        _mobileNoModule(),
                        SizedBox(height: 10.w),
                        Text(
                          "Country",
                          style: AppStyle.textFieldTitleStyle(),
                        ).paddingOnly(bottom: 10),
                        _countryDropDownModule(),
                        SizedBox(height: 10.w),
                        Text(
                          "State",
                          style: AppStyle.textFieldTitleStyle(),
                        ).paddingOnly(bottom: 10),
                        _stateDropDownModule(),
                        SizedBox(height: 10.w),
                        Text(
                          "City",
                          style: AppStyle.textFieldTitleStyle(),
                        ).paddingOnly(bottom: 10),
                        _cityDropDownModule(),
                        SizedBox(height: 10.w),
                        _zipcodeModule(),
                        SizedBox(height: 10.w),
                        _latLongModule(),
                        SizedBox(height: 10.w),
                        AppButton(
                            onPressed: addAddressFunction,
                            child: Text(
                              "Add Address",
                              style: AppStyle.mediumWhite(),
                            )),
                        SizedBox(height: 10.w)
                      ],
                    ))
                  ]));
            }));
  }

  void addAddressFunction() {
    if (con.addressCon.value.text.isEmpty) {
      con.addressValidation.value = true;
      con.addressError.value = "Please Enter your Address.";
    } else {
      con.addressValidation.value = false;
      con.addressError.value = "";
    }

    if (con.mobilenoCon.value.text.isEmpty) {
      con.mobileNoValidation.value = true;
      con.mobileNoError.value = "Please Enter your mobile number.";
    } else if (con.mobilenoCon.value.text.length < 10) {
      con.mobileNoValidation.value = true;
      con.mobileNoError.value = "Please Enter your mobile number 10 digits.";
    } else {
      con.mobileNoValidation.value = false;
      con.mobileNoError.value = "";
    }

    if (con.receiverNameCon.value.text.isEmpty) {
      con.receiveerNameValidation.value = true;
      con.receiveerNameError.value = "Please Enter your name.";
    } else {
      con.receiveerNameValidation.value = false;
      con.receiveerNameError.value = "";
    }

    if (con.floorCon.value.text.isEmpty) {
      con.floorValidation.value = true;
      con.floorError.value = "Please Enter your floor.";
    } else {
      con.floorValidation.value = false;
      con.floorError.value = "";
    }

    if (con.houseCon.value.text.isEmpty) {
      con.houseValidation.value = true;
      con.houseError.value = "Please Enter your house .";
    } else {
      con.houseValidation.value = false;
      con.houseError.value = "";
    }

    if (con.zipcodeCon.value.text.isEmpty) {
      con.zipcodeValidation.value = true;
      con.zipcodeError.value = "Please Enter your zipcode.";
    } else {
      con.zipcodeValidation.value = false;
      con.zipcodeError.value = "";
    }

    if (con.mobileNoValidation.isFalse &&
        con.receiveerNameValidation.isFalse &&
        con.addressValidation.isFalse &&
        con.zipcodeValidation.isFalse) {
      FocusScope.of(Get.context!).unfocus();
      var params = {
        "address": con.addressCon.text,
        "address_type": con.typeValue.value,
        "contact_person_name": con.receiverNameCon.text,
        "contact_person_number": con.mobilenoCon.text,
        "country_id": con.countryDropDownValue.id,
        "state_id": con.stateDropDownValue.id,
        "city_id": con.cityDropDownValue.id,
        "zip_code": con.zipcodeCon.text,
        "latitude": con.latTextEditingController.text,
        "longitude": con.logTextEditingController.text,
        'floor': con.floorCon.text,
        "house": con.houseCon.text
      };

      print(params);

      AuthRepository()
          .addAddressApiCall(params: params, isLoader: con.isLoader);
    }
  }

  Widget _receiverNameModule() {
    return AppTextField(
      titleText: "Receiver Name",
      hintText: "Enter Receiver Name",
      controller: con.receiverNameCon,
      errorMessage: con.receiveerNameError.value,
      showError: con.receiveerNameValidation.value,
      keyboardType: TextInputType.name,
      hintStyle: TextStyle(fontSize: 11.sp, color: AppColors.greyFontColor),
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        con.receiveerNameValidation.value = false;
      },
    );
  }

  Widget _addressModule() {
    return AppTextField(
      titleText: "Address",
      hintText: "Enter Address",
      controller: con.addressCon,
      errorMessage: con.addressError.value,
      showError: con.addressValidation.value,

      keyboardType: TextInputType.name,
      hintStyle: TextStyle(fontSize: 11.sp, color: AppColors.greyFontColor),
      // maxLines: 1,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        con.addressValidation.value = false;
      },
    );
  }

  Widget _floorHouseModule() {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            controller: con.floorCon,
            errorMessage: con.floorError.value,
            showError: con.floorValidation.value,
            titleText: "Floor",
            hintStyle:
                TextStyle(fontSize: 11.sp, color: AppColors.greyFontColor),
            hintText: "Enter fllor",
            keyboardType: TextInputType.text,
            readOnly: false,
            onChanged: (value) {
              con.floorValidation.value = false;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AppTextField(
            controller: con.houseCon,
            errorMessage: con.houseError.value,
            showError: con.houseValidation.value,
            readOnly: false,
            titleText: "House",
            hintStyle:
                TextStyle(fontSize: 11.sp, color: AppColors.greyFontColor),
            hintText: "Enter house",
            keyboardType: TextInputType.text,
            onChanged: (value) {
              con.houseValidation.value = false;
            },
          ),
        )
      ],
    );
  }

  Widget _mobileNoModule() {
    return AppTextField(
      controller: con.mobilenoCon,
      errorMessage: con.mobileNoError.value,
      showError: con.mobileNoValidation.value,
      titleText: "Mobile Number",
      hintText: "Enter Mobile Number",
      keyboardType: TextInputType.phone,
      hintStyle: TextStyle(fontSize: 11.sp, color: AppColors.greyFontColor),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      onChanged: (value) {
        if (con.mobilenoCon.value.text.length == 10) {
          FocusScope.of(Get.context!).unfocus();
        }
        con.mobileNoValidation.value = false;
      },
    );
  }

  _zipcodeModule() {
    return AppTextField(
      controller: con.zipcodeCon,
      errorMessage: con.zipcodeError.value,
      showError: con.zipcodeValidation.value,
      titleText: "Zipcode",
      hintStyle: TextStyle(fontSize: 11.sp, color: AppColors.greyFontColor),
      hintText: "Enter Zipcode",
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(6),
      ],
      onChanged: (value) {
        if (con.zipcodeCon.text.length == 6) {
          FocusScope.of(Get.context!).unfocus();
        }
        con.zipcodeValidation.value = false;
      },
    );
  }

  Widget _addressType() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
        fillColor: AppColors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.grey),
        ),
      ),
      value: con.typeValue.value,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.greyFontColor,
      ),
      items: <String>[
        'home',
        'office',
        'other',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: AppColors.greyFontColor,
              fontSize: 11.sp,
            ),
          ),
        );
      }).toList(),
      isDense: true,
      isExpanded: true,
      dropdownColor: AppColors.white,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      style: TextStyle(
        color: AppColors.blackColor,
        fontSize: 11.sp,
      ),
      onChanged: (value) {
        con.isLoader(true);
        con.typeValue.value = value!;
        con.isLoader(false);
      },
    );
  }

  Widget _countryDropDownModule() {
    return Obx(() => DropdownButtonFormField<Country>(
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey),
            ),
          ),
          hint: const Text("Select country"),
          value: con.countryDropDownValue,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.grey,
          ),
          items: con.countryList.map<DropdownMenuItem<Country>>((value) {
            // log("value.name ${value.countryName}");
            return DropdownMenuItem<Country>(
              value: value,
              child: Text(
                "${value.countryName}",
                style: TextStyle(
                  color: AppColors.greyFontColor,
                  fontSize: 11.sp,
                ),
              ),
            );
          }).toList(),
          isDense: true,
          isExpanded: false,
          dropdownColor: AppColors.white,
          // underline: Container(height: 1, color: AppColors.blackColor),
          // borderRadius: const BorderRadius.all(Radius.circular(15)),
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 11.sp,
          ),
          onChanged: (value) async {
            con.isLoader(true);
            con.countryDropDownValue = value ?? Country();
            // con.stateList.clear();
            // con.stateList.add(StateList(stateName: 'Select state'));
            if (Get.isRegistered<AddAddressController>()) {
              await AuthRepository().getStateListOnlyCall(
                countryId: "${con.countryDropDownValue.id}",
                // usingStateId: true,
              );
            }

            con.isLoader(false);
          },
        ));
  }

  Widget _stateDropDownModule() {
    return Obx(() => DropdownButtonFormField<StateList>(
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey),
            ),
          ),
          hint: const Text("Select state"),
          value: con.stateDropDownValue,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.grey,
          ),
          items:
              con.stateList.map<DropdownMenuItem<StateList>>((StateList value) {
            log("value.name ${value.stateName}");
            return DropdownMenuItem<StateList>(
              value: value,
              child: Text(
                "${value.stateName}",
                style: TextStyle(
                  color: AppColors.greyFontColor,
                  fontSize: 11.sp,
                ),
              ),
            );
          }).toList(),
          isDense: true,
          isExpanded: false,
          dropdownColor: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 11.sp,
          ),
          onChanged: (value) async {
            con.isLoader(true);
            con.stateDropDownValue = value!;

            con.cityList.clear();
            await AuthRepository().getCityListOnlyCall(
              cityId: "${con.stateDropDownValue.id}",
              // usingStateId: true,
            );

            con.isLoader(false);
          },
        ));
  }

  _cityDropDownModule() {
    return Obx(() => DropdownButtonFormField<City>(
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey),
            ),
          ),
          hint: const Text("Select city"),
          value: con.cityDropDownValue,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.grey,
          ),
          items: con.cityList.value.map<DropdownMenuItem<City>>((City value) {
            log("value.name ${value.cityName}");
            return DropdownMenuItem<City>(
              value: value,
              child: Text(
                "${value.cityName}",
                style: TextStyle(
                  color: AppColors.greyFontColor,
                  fontSize: 11.sp,
                ),
              ),
            );
          }).toList(),
          isDense: true,
          isExpanded: false,
          dropdownColor: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 11.sp,
          ),
          onChanged: (value) async {
            con.isLoader(true);
            con.cityDropDownValue = value!;

            con.isLoader(false);
          },
        ));
  }

  Widget _latLongModule() {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            controller: con.latTextEditingController,
            errorMessage: con.latError.value,
            showError: con.latValidation.value,
            titleText: "Latitude",
            hintStyle:
                TextStyle(fontSize: 11.sp, color: AppColors.greyFontColor),
            hintText: "Enter Latitude",
            keyboardType: TextInputType.number,
            readOnly: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              // LengthLimitingTextInputFormatter(6),
            ],
            onChanged: (value) {
              // if (con.latTextEditingController.text.length == 6) {
              //   FocusScope.of(Get.context!).unfocus();
              // }
              con.latValidation.value = false;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AppTextField(
            controller: con.logTextEditingController,
            errorMessage: con.longError.value,
            showError: con.longValidation.value,
            readOnly: true,
            titleText: "Longitude",
            hintStyle:
                TextStyle(fontSize: 11.sp, color: AppColors.greyFontColor),
            hintText: "Enter Longitude",
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              // LengthLimitingTextInputFormatter(6),
            ],
            onChanged: (value) {
              // if (con.logTextEditingController.text.length == 6) {
              //   FocusScope.of(Get.context!).unfocus();
              // }
              con.longValidation.value = false;
            },
          ),
        )
      ],
    );
  }
}
