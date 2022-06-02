import "package:flutter/material.dart";
import 'package:informe/screens/report_form.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);
  static const routeName = "/courses";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, ReportForm.routeName, arguments: {
              "course": {
                "id": "1",
                "name": "Hello Programming",
                "code": "CSCxxx"
              },
              "user": {
                "id": "1",
                "firstname": "Kasemtan",
                "lastname": "Tevasirichokchai",
                "email": "Kasemtan@mail.com",
                "userType": "lecturer",
              },
            });
          },
          child: Text("Test")),
    );
  }
}
