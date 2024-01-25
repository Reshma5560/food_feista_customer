import 'package:dio/dio.dart';
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
      await APIFunction().postApiCall(apiName: ApiUrls.loginUrl, params: params).then(
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
                // Get.offAllNamed(AppRoutes.bottomBarScreen);
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
}
