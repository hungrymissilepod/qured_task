import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String postDate() {
    final DateFormat formatter = DateFormat('dd MMMM y');
    final String formatted = formatter.format(this);
    return formatted;
  }
}
