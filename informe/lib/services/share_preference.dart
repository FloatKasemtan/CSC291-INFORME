import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  static late final SharedPreferences prefs;
  static void init() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  }
}
