import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/widgets/home/logout_button.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    required this.studentId,
    required this.firstname,
    required this.lastname,
    required this.banchelor,
    required this.picture,
  }) : super(key: key);
  final String studentId;
  final String firstname;
  final String lastname;
  final String banchelor;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        right: 25,
        left: 25,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(picture),
            radius: 35,
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  studentId,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  firstname + " " + lastname,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  banchelor,
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
