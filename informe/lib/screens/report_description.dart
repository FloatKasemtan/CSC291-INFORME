import 'package:flutter/material.dart';
import 'package:informe/models/report.dart';

class ReportInfo extends StatelessWidget {
  const ReportInfo({Key? key, this.args}) : super(key: key);
  static const routeName = "/report-info";
  final Map<String, dynamic>? args;

  @override
  Widget build(BuildContext context) {
    ReportModel reportModel = args!["reportModel"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${reportModel.course.code} ${reportModel.course.name}",
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
                readOnly: true,
                controller: TextEditingController(text: reportModel.topic),
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
                  readOnly: true,
                  controller:
                      TextEditingController(text: reportModel.description),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  keyboardAppearance: Brightness.dark,
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
        ]),
      ),
    );
  }
}
