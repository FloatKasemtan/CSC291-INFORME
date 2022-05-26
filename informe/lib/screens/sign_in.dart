import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  CustomTextForm(),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/landing");
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
                  BottomAction()
                ],
              ),
            )
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => const Courses()),
            //       );
            //     },
            //     child: Text("Log in"),decoration: BoxDecoration(
            //           gradient: LinearGradient(
            //               begin: Alignment.centerLeft,
            //               end: Alignment.centerRight,
            //               colors: [Colors.purple, Colors.blue])))
          ],
        ),
      ),
    );
  }
}
