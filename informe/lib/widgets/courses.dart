import "package:flutter/material.dart";

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);
  static const routeName = "/courses";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the courses page'),
    );
  }
}
