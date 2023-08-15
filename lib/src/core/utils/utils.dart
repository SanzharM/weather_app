import 'package:intl/intl.dart';

class Utils {
  static const Duration animationDuration = Duration(milliseconds: 200);

  static DateTime? parseDate(
    dynamic value, {
    String format = 'yyyy-MM-ddTHH:mm',
  }) {
    if (value == null || value == '' || value == 'null') {
      return null;
    }
    try {
      return DateFormat(format).parse('$value');
    } catch (e) {
      return null;
    }
  }
}
