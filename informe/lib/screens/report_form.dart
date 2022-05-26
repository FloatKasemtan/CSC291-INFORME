import 'package:flutter/material.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({Key? key, this.args}) : super(key: key);
  static const routeName = "/report-form";
  final Map<String, dynamic>? args;

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
