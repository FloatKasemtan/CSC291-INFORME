import 'package:informe/models/response/error_response.dart';
import 'package:informe/models/response/info_response.dart';
import 'package:informe/services/constants.dart';
import 'package:informe/services/dio.dart';
import 'package:informe/services/share_preference.dart';

class UserService {
  static Future<dynamic> login(String email, String password) async {
    final response = await DioInstance.dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    if (response.statusCode != 200) {
      return ErrorResponse.fromJson(response.data);
    }
    return InfoResponse.fromJson(response.data);
  }

  static Future<dynamic> getProfile() async {
    DioInstance.dio.options.headers["authorization"] = "Bearer " +
        SharePreference.prefs
            .getString(SharePreferenceConstants.token)
            .toString();
    final response = await DioInstance.dio.get('/auth/me');
    if (response.statusCode != 200) {
      return ErrorResponse.fromJson(response.data);
    }
    return InfoResponse.fromJson(response.data);
  }
}
