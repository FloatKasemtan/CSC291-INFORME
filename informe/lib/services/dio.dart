import 'package:dio/dio.dart';
import 'package:informe/widgets/common/alert.dart';
import 'constants.dart';

class DioInstance {
  static late Dio dio;
  static void init() async {
    var options = BaseOptions(
      baseUrl: Constants.url,
      contentType: 'application/json',
      connectTimeout: 10000,
      receiveTimeout: 5000,
    );
    try {
      dio = Dio(options);
    } on DioError catch (e) {
      print(e);
    }
  }
}
