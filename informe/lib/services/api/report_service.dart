import 'package:informe/models/report.dart';
import 'package:informe/models/request/create_report_model.dart';
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

  static Future<dynamic> getReport(ReportModel data) async {
    DioInstance.dio.options.headers["authorization"] = "Bearer " +
        SharePreference.prefs
            .getString(SharePreferenceConstants.token)
            .toString();
    final response = await DioInstance.dio.post('/report/check',
        data: CreateReportModel.fromReport(data).toJson());
    if (response.statusCode != 200) {
      return ErrorResponse.fromJson(response.data);
    }
    return InfoResponse.fromJson(response.data);
  }

  static Future<dynamic> createReport(ReportModel data) async {
    DioInstance.dio.options.headers["authorization"] = "Bearer " +
        SharePreference.prefs
            .getString(SharePreferenceConstants.token)
            .toString();
    final response = await DioInstance.dio
        .post('/report', data: CreateReportModel.fromReport(data).toJson());
    if (response.statusCode != 200) {
      return ErrorResponse.fromJson(response.data);
    }
    return InfoResponse.fromJson(response.data);
  }

  static Future<dynamic> sendReport(ReportModel data) async {
    DioInstance.dio.options.headers["authorization"] = "Bearer " +
        SharePreference.prefs
            .getString(SharePreferenceConstants.token)
            .toString();
    final response = await DioInstance.dio
        .patch('/report', data: CreateReportModel.fromReport(data).toJson());
    if (response.statusCode != 200) {
      return ErrorResponse.fromJson(response.data);
    }
    return InfoResponse.fromJson(response.data);
  }
}
