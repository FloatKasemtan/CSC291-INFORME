import 'package:dio/dio.dart';
import 'constants.dart';

class DioInstance {
  static late Dio dio;
  static void init() async {
    var options = BaseOptions(
      baseUrl: Constants.url,
      contentType: 'application/json',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    try {
      dio = Dio(options);
    } catch (e) {
      // print(e);
    }
  }
}
