import 'package:intl/intl.dart';

class AppDateFormat {
  AppDateFormat._();

  static String tipsDate(String date) {
    DateTime dateTime = DateTime.parse(date).toLocal();
    return DateFormat('d MMM | h:mm:a').format(dateTime);
  } static String tipsPerDate(String date) {
    DateTime dateTime = DateTime.parse(date).toLocal();
    return DateFormat('dd MMMM yyyy').format(dateTime);
  }
}
