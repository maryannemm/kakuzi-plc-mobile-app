//returns todays date
import 'package:intl/intl.dart';

//converts datetime object to a string
String todaysDateyyyymmdd() {
  var dateTimeObject = DateTime.now();
  var formatter = DateFormat('yyyyMMdd');
  String yyyymmdd = formatter.format(dateTimeObject);

  return yyyymmdd;
}

// converts string to a date time object
DateTime createDateTimeObject(String yyyymmdd) {
  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));
  DateTime dateTimeObject = DateTime(yyyy, mm, dd);
  return dateTimeObject;
}

String convertDateTimeToYYYYMMDD(DateTime dateTime) {
  var formatter = DateFormat('yyyyMMdd');
  String yyyymmdd = formatter.format(dateTime);
  return yyyymmdd;
}
