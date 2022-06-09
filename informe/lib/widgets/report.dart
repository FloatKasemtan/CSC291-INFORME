import 'package:flutter/material.dart';
import 'package:informe/models/report.dart';
import 'package:informe/widgets/report/report_card.dart';

class Report extends StatelessWidget {
  const Report({Key? key, required this.data}) : super(key: key);
  static const routeName = "/report";

  final List<ReportModel> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: ListView(children: [
        Text(
          "Report status",
          style: Theme.of(context).textTheme.headline1,
        ),
        ...data
            .map((e) => ReportCard(
                  reportModel: e,
                ))
            .toList()
      ]),
    );
  }
}
