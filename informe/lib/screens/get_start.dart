import 'package:flutter/material.dart';
import 'package:informe/screens/sign_in.dart';
import 'package:informe/services/constants.dart';
import 'package:informe/services/share_preference.dart';
import 'package:informe/widgets/get_start/next_button.dart';
import 'package:informe/widgets/get_start/text_welcome.dart';

class GetStart extends StatefulWidget {
  const GetStart({Key? key}) : super(key: key);
  static const routeName = "/get-start";

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  void initState() {
    super.initState();
    if (SharePreference.prefs.getString(SharePreferenceConstants.isFirst) !=
        null) {
      Navigator.pushReplacementNamed(context, SignIn.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
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
              children: const [
                TextWelcome(),
                NextButton(),
              ],
            )));
  }
}
