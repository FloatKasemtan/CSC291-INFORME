import 'package:informe/models/response/error_response.dart';
import 'package:informe/models/response/info_response.dart';
import 'package:informe/services/constants.dart';
import 'package:informe/services/dio.dart';
import 'package:informe/services/share_preference.dart';

class ReportService {
  static Future<dynamic> getReportedList() async {
    DioInstance.dio.options.headers["authorization"] = "Bearer " +
        SharePreference.prefs
            .getString(SharePreferenceConstants.token)
            .toString();
    final response = await DioInstance.dio.get('/report');
    if (response.statusCode != 200) {
      return ErrorResponse.fromJson(response.data);
    }
    return InfoResponse.fromJson(response.data);
  }
}
