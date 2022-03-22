import 'package:dio/dio.dart';
import 'constants.dart';

class DioInstance {
  late Dio dio;
  void init() async {
    try {
      var dio = Dio();
      final response = await dio.get('https://google.com');
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
