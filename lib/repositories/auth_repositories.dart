import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:foodapplication/controller/account/components/add_address_controller.dart';
import 'package:foodapplication/controller/account/components/manage_Address_controller.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

import '../controller/get_city_controller].dart';
import '../data/api/api_function.dart';
import '../data/handler/api_url.dart';
import '../data/models/get_add_by_id_model.dart';
import '../data/models/get_address_model.dart';
import '../data/models/get_city_model.dart';
import '../data/models/get_country_model.dart';
import '../data/models/get_state_model.dart';
import '../data/models/search_city_model.dart';
import '../res/color_print.dart';
import '../res/ui_utils.dart';
import '../utils/local_storage.dart';
import '../utils/utils.dart';

class AuthRepository {
  Future<dynamic> loginApi({dynamic params, RxBool? isLoader}) async {
    try {
      isLoader?.value = true;
      printData(key: "Login params", value: params);
      await APIFunction()
          .postApiCall(apiName: ApiUrls.loginUrl, params: params)
          .then(
        (response) async {
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
            }

            /// Set User Token
            await LocalStorage.setLoginToken(userToken: response["token"]);

            /// Set User Data
            await LocalStorage.storeDataInfo(data: response['user']).then(
              (value) {
                // Get.delete<RegisterController>(force: true);
                Get.offAllNamed(AppRoutes.getCityScreen);
              },
            );

            // /// Set links
            // if (!isValEmpty(response["links"])) {
            //   await LocalStorage.updateOrStoreLikes(linkObject: response["links"]);
            // }

            // /// Like concept status
            // await LocalStorage.updateTipLikeStatus(likeConcePT: response["data"]['like_concept']);
          }
          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  Future<dynamic> updatePasswordApiCall(
      {RxBool? isLoader, dynamic params}) async {
    try {
      isLoader?.value = true;
      await APIFunction()
          .postApiCall(apiName: ApiUrls.updatePasswordUrl, params: params)
          .then(
        (response) async {
          printData(key: "update password response", value: response);
          if (!isValEmpty(response) && response["success"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              Get.back();
              Get.offAllNamed(AppRoutes.indexScreen);
            }
          }
          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  Future<dynamic> addAddressApiCall({RxBool? isLoader, dynamic params}) async {
    try {
      isLoader?.value = true;
      await APIFunction()
          .postApiCall(apiName: ApiUrls.addAddressUrl, params: params)
          .then(
        (response) async {
          printData(key: "add address response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              // Get.back();
              Get.offAllNamed(AppRoutes.manageAddressScreen);
            }
          }
          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  // get country api
  Future<void> getCountryApiCall({RxBool? isLoader}) async {
    final AddAddressController con = Get.find<AddAddressController>();
    RxBool isSuccessStatus = false.obs;
    try {
      isLoader?.value = true;
      await APIFunction()
          .getApiCall(
        apiName: ApiUrls.getCountryUrl,
      )
          .then(
        (response) async {
          printData(key: "get country response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetCountryModel getCountryModel =
                GetCountryModel.fromJson(response);
            isSuccessStatus.value = getCountryModel.status!;
            if (isSuccessStatus.value) {
              con.countryList.add(Country(countryName: 'Select country'));
              con.countryList.addAll(getCountryModel.data!);
              con.countryDropDownValue = con.countryList[0];
              con.countryList.refresh();
            } else {
              log("getCountryApiFunction else");
            }
          }
          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  // get state api
  Future<void> getStateListOnlyCall(
      {RxBool? isLoader, String? countryId}) async {
    final AddAddressController con = Get.find<AddAddressController>();
    RxBool isSuccessStatus = false.obs;
    try {
      isLoader?.value = true;
      await APIFunction()
          .getApiCall(
        apiName: "${ApiUrls.getStateUrl}$countryId",
      )
          .then(
        (response) async {
          if (!isValEmpty(response) && response["status"] == true) {
            GetStateModel getStateModel = GetStateModel.fromJson(response);
            isSuccessStatus.value = getStateModel.status!;
            if (isSuccessStatus.value) {
              con.stateList.add(StateList(stateName: 'Select state'));
              con.stateList.value = getStateModel.data ?? [];
              if (con.stateList.isNotEmpty) {
                con.stateDropDownValue = con.stateList[0];
              }
              printData(key: "get state response", value: con.stateList.length);
              // con.stateList.refresh();
            } else {
              log("getStateApiFunction else");
            }
          }
          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  /// get city api
  Future<void> getCityListOnlyCall({RxBool? isLoader, String? cityId}) async {
    final con = Get.find<AddAddressController>();
    RxBool isSuccessStatus = false.obs;
    try {
      isLoader?.value = true;
      await APIFunction()
          .getApiCall(
        apiName: "${ApiUrls.getCityUrl}$cityId",
      )
          .then(
        (response) async {
          printData(key: "get city response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetCityModel getCityModel = GetCityModel.fromJson(response);
            isSuccessStatus.value = getCityModel.status!;
            if (isSuccessStatus.value) {
              con.cityList.add(City(cityName: 'Select city'));
              con.cityList.addAll(getCityModel.data!);
              con.cityDropDownValue = con.cityList[0];
              con.cityList.refresh();
            } else {
              log("getCityApiFunction else");
            }
          }
          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

//get all address api
  Future<dynamic> getAddressApiCall({RxBool? isLoader}) async {
    final con = Get.find<ManageAddressController>();

    try {
      isLoader?.value = true;
      await APIFunction().getApiCall(apiName: ApiUrls.getAddressUrl).then(
        (response) async {
          printData(key: "get address  response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetAddressModel data = GetAddressModel.fromJson(response);

            con.getAddressData = data;
            log("${con.getAddressData}");
          }
          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
      rethrow;
    } finally {
      isLoader?.value = false;
    }
  }

  Future<dynamic> updateAddressApiCall(
      {RxBool? isLoader, dynamic params}) async {
    try {
      isLoader?.value = true;
      await APIFunction()
          .postApiCall(apiName: ApiUrls.updateAddressUrl, params: params)
          .then(
        (response) async {
          printData(key: "update address response", value: response);
          if (!isValEmpty(response) && response["success"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              Get.back();
              Get.offAllNamed(AppRoutes.indexScreen);
            }
          }
          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  // get address by id api
  Future<void> getAddressByIdApiCall(
      {RxBool? isLoader, String? addressId}) async {
    final AddAddressController con = Get.find<AddAddressController>();
    try {
      isLoader?.value = true;
      await APIFunction()
          .getApiCall(
        apiName: "${ApiUrls.getAddressByIdUrl}$addressId",
      )
          .then(
        (response) async {
          printData(key: "get address  response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetAddressByIdModel data = GetAddressByIdModel.fromJson(response);

            con.getAddressData = data;
            con.receiverNameCon.text =
                con.getAddressData!.data.contactPersonName;
            con.mobilenoCon.text = con.getAddressData!.data.contactPersonNumber;
            con.zipcodeCon.text = con.getAddressData!.data.zipCode;
            con.countryDropDownValue =
                Country(countryName: "${con.getAddressData!.data.country}");
            con.stateDropDownValue =
                StateList(stateName: "${con.getAddressData!.data.state}");
            con.cityDropDownValue =
                City(cityName: "${con.getAddressData!.data.city}");

            log("${con.getAddressData}");
          }

          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  // remove address by id api
  Future<void> removeAddressByIdApiCall(
      {RxBool? isLoader, String? addressId}) async {
    final ManageAddressController con = Get.find<ManageAddressController>();
    RxBool isSuccessStatus = false.obs;
    try {
      isLoader?.value = true;
      await APIFunction()
          .deleteApiCall(
        apiName: "${ApiUrls.removeAddressUrl}$addressId",
      )
          .then(
        (response) async {
          log(response['status'].toString());
          if (!isValEmpty(response) && response["status"] == true) {
            if (isSuccessStatus.value) {
              await getAddressApiCall()
                  .then((value) => isLoader?.value = false);
            } else {
              log("getAddressByIdApiCall else");
            }
          }
          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }

  /// get search City api
  Future<void> getSearchCityListOnlyCall({required String searchText}) async {
    final con = Get.find<GetCityController>();
    RxBool isSuccessStatus = false.obs;
    con.isLoading.value=true;
    try {
      await APIFunction()
          .getApiCall(apiName: "${ApiUrls.searchCityUrl}?city=$searchText")
          .then(
        (response) async {
          printData(key: "get city response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            SearchCityModel searchCityModel =
                SearchCityModel.fromJson(response);
            isSuccessStatus.value = searchCityModel.status!;
            if (isSuccessStatus.value) {
              con.searchCityData = searchCityModel.data;
              con.cityTextController.value.text=con.searchCityData!.cityName.toString();
              log("con.cityTextController.value.text ${con.cityTextController.value.text}")
;            } else {
              log("getCityApiFunction else");
            }
          }
          return response;
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      con.isLoading.value = false;
    }
  }
}
