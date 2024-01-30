import 'package:dio/dio.dart';
import 'package:foodapplication/route/app_routes.dart';
import 'package:get/get.dart';

import '../data/api/api_function.dart';
import '../data/handler/api_url.dart';
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
                Get.offAllNamed(AppRoutes.indexScreen);
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
}
