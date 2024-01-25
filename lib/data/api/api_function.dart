import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../utils/local_storage.dart';
import '../../utils/utils.dart';
import '../handler/api_url.dart';
import 'api_class.dart';

class APIFunction {
  /// ------ To Call Post Api -------------------->>>
  Future<dynamic> postApiCall(
      {required String apiName, dynamic params, bool? isDecode}) async {
    if (await getConnectivityResult()) {
      if (!isValEmpty(params)) {
        log("-=-=-=-Post Api=-=-=-> $params");
      }
      var response = await HttpUtil().post(
        apiName,
        isDecode: isDecode ?? false,
        data: params,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${LocalStorage.token.value}",
          },
        ),
      );
      return response;
    }
  }

  /// ------ To Call Put Api -------------------->>>
  Future<dynamic> putApiCall(
      {required String apiName, dynamic params, data, bool? isDecode}) async {
    if (await getConnectivityResult()) {
      if (!isValEmpty(params)) {
        log("-=-=-=-Put Api=-=-=-> $params");
      }
      var response = await HttpUtil().put(
        apiName,
        isDecode: isDecode ?? false,
        data: data,
        queryParameters: params,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${LocalStorage.token.value}",
          },
        ),
      );
      return response;
    }
  }

  /// ------ To Call Get Api -------------------->>>
  Future<dynamic> getApiCall({
    required String apiName,
    dynamic queryParameters,
    RxBool? isLoading,
  }) async {
    if (await getConnectivityResult()) {
      isLoading?.value = true;

      // printAction("params -------->>> $queryParameters");
      var response = await HttpUtil().get(
        (ApiUrls.baseUrl + apiName),
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${LocalStorage.token.value}",
          },
        ),
      );
      return response;
    }
  }

/*
  /// ------ To Call POST FormData -------------------->>>
  Future<dynamic> postFormDataApiCall({
    required String apiName,
    required dio.FormData formData,
    dynamic queryParameters,
    RxBool? isLoading,
  }) async {
    if (await getConnectivityResult()) {
      isLoading?.value = true;
      try {
        var response = await HttpUtil().postForm(
          (ApiUrls.baseUrl + apiName),
          queryParameters: queryParameters,
          formData: formData,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer ${LocalStorage.token.value}",
            },
          ),
        );

        // toast(response['data']['message'].toString());
        return response;
      } catch (e) {
        isLoading?.value = false;
      }
    }
  } */

  /// ------ To Call Post Api -------------------->>>
  Future<dynamic> deleteApiCall(
      {required String apiName,
      dynamic params,
      bool isFormData = false}) async {
    if (await getConnectivityResult()) {
      var response = await HttpUtil().delete(
        apiName,
        data: params,
        options: Options(
          headers: {
            "Content-Type": "application/json",
              "Authorization": "Bearer ${LocalStorage.token.value}",
          },
        ),
      );
      return response;
    }
  }
}
