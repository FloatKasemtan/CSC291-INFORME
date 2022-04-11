import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  const Report({Key? key, required this.mockdata}) : super(key: key);
  static const routeName = "/report";

  final List<Object> mockdata;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
      child: ListView(children: [
        Text(
          "Report status",
          style: Theme.of(context).textTheme.headline1,
        ),
        ...mockdata.map((e) => Text("asd")).toList()
      ]),
    );
  }
}
