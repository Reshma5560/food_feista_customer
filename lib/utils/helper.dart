class Helper {
  static bool isEmail(String em) {
    return RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})").hasMatch(em);
  }

  static bool isPassword(String em) {
    return RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$').hasMatch(em);
  }

  static bool isPhoneNumber(String em) {
    return (RegExp(r'^[0-9]').hasMatch(em) && em.length == 10);
  }

  static String convertDurationToMinutes(String text) {
    String data = '00:00:30';
    List<String> splitData = data.toString().split(':');
    int result = (int.parse(splitData[0].toString()) * 60) + int.parse(splitData[1].toString());
    int duration = result;
    if (splitData[2].toString() != '0') {
      duration = result + 1;
    }
    return "$duration Min";
  }
}
