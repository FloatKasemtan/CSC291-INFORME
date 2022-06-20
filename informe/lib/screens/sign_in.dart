import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/models/response/info_response.dart';
import 'package:informe/models/user.dart';
import 'package:informe/services/api/user_service.dart';
import 'package:informe/services/constants.dart';
import 'package:informe/services/share_preference.dart';
import 'package:informe/widgets/common/alert.dart';
import 'package:informe/widgets/courses.dart';
import 'package:informe/screens/get_start.dart';
import 'package:informe/widgets/home.dart';
import 'package:informe/widgets/sign_in/bottom_action.dart';
import 'package:informe/widgets/sign_in/custom_textform.dart';
import 'package:informe/widgets/sign_in/logo.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const routeName = "/sign-in";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  void getProfile() async {
    try {
      final response = await UserService.getProfile();
      if (response is InfoResponse) {
        Navigator.pushNamed(context, '/landing');
      }
    } on DioError catch (e) {
      SharePreference.prefs.remove(SharePreferenceConstants.token);
      SharePreference.prefs.remove(SharePreferenceConstants.isLecturer);
      Alert.errorAlert(e, context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (SharePreference.prefs.getString(SharePreferenceConstants.token) !=
        null) {
      getProfile();
    }
  }

  void loginHandler() async {
    try {
      var response = await UserService.login(_email.text, _password.text);
      if (response is InfoResponse) {
        SharePreference.prefs
            .setString(SharePreferenceConstants.token, response.data["token"]);
        SharePreference.prefs.setBool(SharePreferenceConstants.isLecturer,
            User.fromJson(response.data["user"]).userType == UserType.lecturer);

        Navigator.of(context).pushNamed("/landing");
      }
    } on DioError catch (e) {
      SharePreference.prefs.remove(SharePreferenceConstants.token);
      SharePreference.prefs.remove(SharePreferenceConstants.isLecturer);
      Alert.errorAlert(e, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    _email.text = 'Bartholome.Sporer@yahoo.com';
    _password.text = 'XwdwwU2Bj_bMYBw';
    return Scaffold(
      backgroundColor: const Color(0xFF161D3A),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
              opacity: 0.25),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Logo(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextForm(email: _email, password: _password),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      loginHandler();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF00B5FF),
                            Color(0xFF07A0FF),
                            Color(0xFF2D55E2),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          "Log in",
                          style: GoogleFonts.poppins(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  const BottomAction()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
