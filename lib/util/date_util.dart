class DateUtil {
  static String formatDate(DateTime dateTime) {
    var hour = dateTime.hour;
    var amPm = dateTime.hour > 11 ? 'PM' : 'AM';
    if (hour > 12) hour -= 12;

    return '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')} $amPm';
  }
}
