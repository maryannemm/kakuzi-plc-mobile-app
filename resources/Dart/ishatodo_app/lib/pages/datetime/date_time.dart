//returns todays date

//converts datetime object to a string
String todaysDateyyyymmdd() {
  var dateTimeObject = DateTime.now();

  String year = dateTimeObject.year.toString();

  String month = dateTimeObject.month.toString();

  if (month.length == 1) {
    month = '0$month';
  }
  String day = dateTimeObject.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }
  String yyyymmdd = year + month + day;
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
