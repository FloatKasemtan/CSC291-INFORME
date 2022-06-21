import "package:flutter/material.dart";
import 'package:informe/models/response/info_response.dart';
import 'package:informe/services/api/course_service.dart';
import '../models/course.dart';
import 'package:informe/models/report.dart';
import 'package:informe/models/user.dart';
import 'package:informe/screens/course_info.dart';
import 'package:informe/screens/report_form.dart';
import 'package:informe/widgets/courses/card_course.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);
  static const routeName = "/courses";

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> data = [];

  void handleCourseList() async {
    final response = await CourseService.listCourses();
    if (response is InfoResponse) {
      List<Course> tempCourse = [];
      for (var item in response.data) {
        tempCourse.add(Course.fromJson(item));
        print(item);
      }
      setState(() {
        data = tempCourse;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    handleCourseList();
  }

  @override
  Widget build(BuildContext context) {
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
