import 'package:flutter/material.dart';
import 'package:informe/models/course.dart';
import 'package:informe/models/report.dart';
import 'package:informe/models/user.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({Key? key, this.args}) : super(key: key);
  static const routeName = "/report-form";
  final Map<String, dynamic>? args;

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  late ReportModel reportModel;
  @override
  void initState() {
    setState(() {
      reportModel = ReportModel(
          topic: "",
          course: Course.fromJson(widget.args!["course"]),
          user: User.fromJson(widget.args!["user"]));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(reportModel);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${reportModel.course.code} ${reportModel.course.name}",
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        centerTitle: false,
        backgroundColor: Color(0xff434465),
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back",
              style: Theme.of(context).textTheme.subtitle1,
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF161D3A),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Topic"),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: const Color(0xff1D284F),
              child: const TextField(
                decoration: InputDecoration(
                    focusColor: Colors.white, fillColor: Colors.white),
                cursorColor: Colors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
