import 'package:flutter/material.dart';
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
  var baba = "SAd";

  void click(String text) {
    setState(() {
      baba = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161D3A),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Logo(),
            CustomTextForm(),
            ElevatedButton(onPressed: () {}, child: Text("Log in")),
            BottomAction()
          ],
        ),
      ),
    );
  }
}
