import 'package:intl/intl.dart';

extension RelativeTimeExtension on DateTime {
  String relativeTime() {
    DateTime currentDateTime = DateTime.now();
    DateTime currentDate = DateTime(
        currentDateTime.year, currentDateTime.month, currentDateTime.day);
    var dayRank = 1 + currentDate.weekday % 7;
    int diff = currentDate.difference(this).inDays;
    if (diff.isNegative) {
      return 'Future Date!)';
    } else if (diff == 0) {
      return 'Today';
    } else if (diff < dayRank) {
      return diff == 1 ? 'Yesterday' : DateFormat('EEEE').format(this);
    } else if (diff < (7 + dayRank)) {
      return 'Last Week';
    } else if (diff < (14 + dayRank)) {
      return 'Two Weeks ago';
    } else if (diff < (21 + dayRank)) {
      return 'Three Weeks ago';
    } else if (currentDate.month == (month) && currentDate.year == (year)) {
      return 'This Month';
    } else if (currentDate.year == (year)) {
      return 'This Year';
    } else {
      return 'Older';
    }
  }
}
