import 'package:intl/intl.dart';

String getFormattedDate(DateTime date, {String format= 'dd/MM/yyyy'}) {
  if (date.year < 1900) {
    return "";
  }
  DateFormat formatter = DateFormat(format);
  return formatter.format(date);
}