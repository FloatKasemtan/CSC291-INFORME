import 'package:dio/dio.dart';
import 'constants.dart';

class DioInstance {
  static late Dio dio;
  static void init() async {
    var options = BaseOptions(
      baseUrl: 'localhost:8080',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    try {
      dio = Dio(options);
    } catch (e) {
      print(e);
    }
  }
}
