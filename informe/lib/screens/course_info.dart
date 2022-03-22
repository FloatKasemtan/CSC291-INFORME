import 'package:flutter/material.dart';

class CourseInfo extends StatelessWidget {
  const CourseInfo({ Key? key }) : super(key: key);
  static const routeName = "/course-info";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final courseId = routeArgs['id'];
    // fetch course data using course id

    return Container(
      
    );
  }
}