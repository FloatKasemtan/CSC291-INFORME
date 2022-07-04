import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:informe/models/response/info_response.dart';
import 'package:informe/services/api/course_service.dart';
import 'package:informe/widgets/common/alert.dart';
import '../models/course.dart';
import 'package:informe/widgets/courses/card_course.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);
  static const routeName = "/courses";

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> data = [];
  bool isLoading = true;

  void handleCourseList() async {
    try {
      final response = await CourseService.listCourses();
      if (response is InfoResponse) {
        List<Course> tempCourse = [];
        for (var item in response.data) {
          tempCourse.add(Course.fromJson(item));
        }
        setState(() {
          data = tempCourse;
        });
      }
    } on DioError catch (e) {
      Alert.errorAlert(e, context);
    } finally {
      setState(() {
        isLoading = false;
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
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
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
  }
}
