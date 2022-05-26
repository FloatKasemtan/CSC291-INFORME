import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/logoindex.png',
            width: 130,
            height: 115,
          ),
          Container(
            margin: const EdgeInsets.only(left: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Study with better with",
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                Text(
                  "Informe",
                  style: GoogleFonts.mali(fontSize: 36),
                  // (Theme.of(context).textTheme.bodyText2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
