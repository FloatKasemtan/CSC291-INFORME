import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:informe/models/response/info_response.dart';
import 'package:informe/services/api/user_service.dart';
import 'package:informe/services/constants.dart';
import 'package:informe/services/share_preference.dart';
import 'package:informe/widgets/common/alert.dart';
import 'package:informe/widgets/common/under_construction.dart';
import 'package:informe/widgets/home/logout_button.dart';
import 'package:informe/widgets/home/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  late String studentId;
  late String firstname;
  late String lastname;
  late String banchelor;

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  void getProfile() async {
    try {
      final response = await UserService.getProfile();
      if (response is InfoResponse) {
        if (SharePreference.prefs
            .getBool(SharePreferenceConstants.isLecturer)!) {
          setState(() {
            studentId = "Lecturer";
            firstname = response.data["firstname"];
            lastname = response.data["lastname"];
            banchelor = response.data["email"];
          });
        } else {
          setState(() {
            studentId = response.data["Student"]["student_id"];
            firstname = response.data["firstname"];
            lastname = response.data["lastname"];
            banchelor = response.data["Student"]["banchelor"];
          });
        }
        setState(() {
          isLoading = false;
          return;
        });
      }
    } on DioError catch (e) {
      Alert.errorAlert(e, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Column(
                  children: [
                    Profile(
                        studentId: studentId,
                        firstname: firstname,
                        lastname: lastname,
                        banchelor: banchelor,
                        picture:
                            "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png"),
                    const SizedBox(height: 16),
                    const LogoutButton(),
                  ],
                ),
                Expanded(
                  // height: MediaQuery.of(context).size.height - 173,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      UnderConstruction(),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
