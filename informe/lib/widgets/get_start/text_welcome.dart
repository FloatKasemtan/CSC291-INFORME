import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWelcome extends StatelessWidget {
  const TextWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 180,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome  to  ",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Informe",
                  style: GoogleFonts.mali(fontSize: 24),
                  // (Theme.of(context).textTheme.bodyText2),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Learn with no worried with Informe.",
                  maxLines: 4, // you can change it accordingly
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
