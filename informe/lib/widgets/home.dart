import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Column(
            children: const [
              Profile(
                  studentId: "63130500237",
                  firstname: "Kasemtan",
                  lastname: "Tevasirichokchai",
                  banchelor: "Computer Science",
                  picture:
                      "https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg"),
              LogoutButton(),
            ],
          ),
          Expanded(
            // height: MediaQuery.of(context).size.height - 173,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                UnderConstruction(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
