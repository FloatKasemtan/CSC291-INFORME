import 'package:flutter/material.dart';
import 'package:informe/screens/courses.dart';
import 'package:informe/screens/report.dart';
import 'package:informe/screens/schedule.dart';
import 'package:informe/widgets/common/gradient_icon.dart';
import 'package:informe/widgets/common/navigation_bar.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Profile(
            studentId: "63130500237",
            firstname: "Kasemtan",
            lastname: "Tevasirichokchai",
            banchelor: "Computer Science",
            picture:
                "https://scontent.fbkk22-3.fna.fbcdn.net/v/t39.30808-6/272189473_4868661459916486_3850036912764138839_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeElZlkqRCrMjXY7KJb7Yb1Jzyyi7l8sybHPLKLuXyzJsfdZcIWA3QUMEJ8EbN5XslrmXaXJOtau9zTdbZ5VDr56&_nc_ohc=DLT826L3jUEAX8mKSMV&_nc_ht=scontent.fbkk22-3.fna&oh=00_AT9dO8tWEO-_YL8jdC0ngBCmmCqOeADNjgjN3tVsT57ZuA&oe=62408F18"),
        LogoutButton(),
        SizedBox(
          height: 20,
        ),
        UnderConstruction()
      ],
    );
  }
}
