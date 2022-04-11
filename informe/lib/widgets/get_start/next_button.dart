import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/screens/sign_in.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 400,
          right: 25,
          left: 25,
        ),
        child: (ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SignIn.routeName);
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
                  Color(0xFFFFEA00),
                  Color(0xFFFFD200),
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
                "Next",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ))

        // child: TextButton(
        //   child: Text(
        //     "Next",
        //     style: GoogleFonts.poppins(
        //       color: Colors.white,
        //       fontSize: 14,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pushNamed(SignIn.routeName);
        //   },
        // ),
        );
  }
}
