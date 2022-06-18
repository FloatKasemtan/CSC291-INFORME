import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/screens/sign_in.dart';
import 'package:informe/services/share_preference.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          "Log out",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          // Clear user token
          SharePreference.prefs.clear();
          Navigator.of(context).pushNamed(SignIn.routeName);
        },
      ),
    );
  }
}
