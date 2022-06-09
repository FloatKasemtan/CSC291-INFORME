import 'dart:html';

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
  TextEditingController topicController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    setState(() {
      reportModel = widget.args!['reportModel'];
      topicController.text = reportModel.topic;
      descriptionController.text = reportModel.description;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${reportModel.course.code}: ${reportModel.course.name}",
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        centerTitle: false,
        backgroundColor: const Color(0xff434465),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF161D3A),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "To User : ",
                  style: Theme.of(context).textTheme.headline2),
              TextSpan(
                  text:
                      "${reportModel.user.firstname} ${reportModel.user.lastname}",
                  style: Theme.of(context).textTheme.subtitle1)
            ]),
            // style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Topic", style: Theme.of(context).textTheme.headline2),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color(0xff1D284F),
              child: TextField(
                controller: topicController,
                decoration: const InputDecoration(
                  focusColor: Colors.white,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                cursorColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Description", style: Theme.of(context).textTheme.headline2),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: const Color(0xff1D284F),
                child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  keyboardAppearance: Brightness.dark,
                  controller: descriptionController,
                  scrollController: ScrollController(),
                  decoration: const InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  cursorColor: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Submit",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              style: ElevatedButton.styleFrom(primary: const Color(0xff72BC8E)),
            ),
          ),
        ]),
      ),
    );
  }
}
