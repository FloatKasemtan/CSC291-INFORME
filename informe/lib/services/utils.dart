import 'package:informe/models/report.dart';

class Utils {
  static String capitalize(String s) {
    return "${s.substring(0, 1).toUpperCase()}${s.substring(1).toLowerCase()}";
  }

  static String getStatus(Status status) {
    switch (status) {
      case Status.approved:
        return "APPROVED";
      case Status.draft:
        return "DRAFT";
      case Status.empty:
        return "EMPTY";
      case Status.sent:
        return "SENT";
      case Status.viewed:
        return "VIEWED";
      default:
        return "";
    }
  }
}
