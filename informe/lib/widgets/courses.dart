import "package:flutter/material.dart";
import '../models/course.dart';
import 'package:informe/models/report.dart';
import 'package:informe/models/user.dart';
import 'package:informe/screens/course_info.dart';
import 'package:informe/screens/report_form.dart';
import 'package:informe/widgets/courses/card_course.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);
  static const routeName = "/courses";

  @override
  Widget build(BuildContext context) {
    List<Course> data = [
      Course(
          id: "1",
          name: "xxx xxxxx...",
          start: "13:00",
          end: "16:00",
          code: "CSCxxx",
          date: "Mon",
          lecturer: User(id: "11", firstname: "AAA", lastname: "BBB")),
      Course(
          id: "2",
          name: "xxx xxxxx...",
          start: "9:00",
          end: "12:00",
          code: "CSCxxx",
          date: "Tue",
          lecturer: User(id: "12", firstname: "CCC", lastname: "DDD")),
      Course(
          id: "3",
          name: "xxx xxxxx...",
          start: "13:00",
          end: "16:00",
          code: "CSCxxx",
          date: "Tue",
          lecturer: User(id: "13", firstname: "EEE", lastname: "FFF")),
      Course(
          id: "4",
          name: "xxx xxxxx...",
          start: "13:00",
          end: "16:00",
          code: "CSCxxx",
          date: "Wed",
          lecturer: User(id: "14", firstname: "GGG", lastname: "HHH")),
      Course(
          id: "5",
          name: "xxx xxxxx...",
          start: "9:00",
          end: "12:00",
          code: "CSCxxx",
          date: "Thu",
          lecturer: User(id: "11", firstname: "AAA", lastname: "BBB")),
      Course(
          id: "6",
          name: "xxx xxxxx...",
          start: "13:00",
          end: "16:00",
          code: "CSCxxx",
          date: "Fri",
          lecturer: User(id: "12", firstname: "CCC", lastname: "DDD"))
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: ListView(children: [
        Text(
          "Your Courses",
          style: Theme.of(context).textTheme.headline1,
        ),
        ...data
            .map((
              e,
            ) =>
                CardCourse(
                  course: e,
                  index: data.indexOf(e),
                ))
            .toList()
      ]),
    );
    // return Center(
    //   child: ElevatedButton(
    //     onPressed: () {
    //       Navigator.pushNamed(context, ReportForm.routeName, arguments: {
    //         "reportModel": ReportModel(
    //           user: User(
    //               id: "1",
    //               email: "Kasemtan@mail.com",
    //               firstname: "Kasemtan",
    //               lastname: "Tevasirichokchai",
    //               userType: UserType.lecturer),
    //           course:
    //               Course(name: "Hello Programming", code: "CSC333", id: "1"),
    //         ),
    //       });
    //     },
    //     child: CardCourse(),
    //     //  Text("Test")
    //   ),
    // );
  }
}
