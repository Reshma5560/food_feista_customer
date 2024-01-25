import 'package:flutter/foundation.dart';

class AppEnvironment {
  String getApiURL() {
    if (kReleaseMode) {
      return "https://foodfiesta.omtecweb.com/api/";
    } else if (kDebugMode) {
      // return "http://192.168.0.123:4000/v1/";
      return "https://foodfiesta.omtecweb.com/api/";
    } else {
      return "";
    }
  }

  // String getSocketURL() {
  //   if (kReleaseMode) {
  //     return "https://apistocktips.micrasolution.com";
  //   } else if (kDebugMode) {
  //     // return "http://192.168.0.123:4000";
  //     return "https://apistocktips.micrasolution.com";
  //   } else {
  //     return "";
  //   }
  // }
}
