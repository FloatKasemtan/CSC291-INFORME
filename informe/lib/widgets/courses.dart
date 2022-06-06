import "package:flutter/material.dart";
import 'package:informe/models/course.dart';
import 'package:informe/models/report.dart';
import 'package:informe/models/user.dart';
import 'package:informe/screens/course_info.dart';
import 'package:informe/screens/report_form.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);
  static const routeName = "/courses";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ReportForm.routeName, arguments: {
                "reportModel": ReportModel(
                  user: User(
                      id: "1",
                      email: "Kasemtan@mail.com",
                      firstname: "Kasemtan",
                      lastname: "Tevasirichokchai",
                      userType: UserType.lecturer),
                  course: Course(
                      name: "Hello Programming", code: "CSC333", id: "1"),
                ),
              });
            },
            child: Text("To report form")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, CourseInfo.routeName,
                  arguments: {"id": "1"});
            },
            child: Text("To course info")),
      ],
    );
  }
}
