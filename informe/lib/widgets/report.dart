import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:informe/models/report.dart';
import 'package:informe/models/response/info_response.dart';
import 'package:informe/services/api/report_service.dart';
import 'package:informe/widgets/common/alert.dart';
import 'package:informe/widgets/report/report_card.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);
  static const routeName = "/report";

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<ReportModel> data = [];
  bool isLoading = true;

  void handleReport() async {
    try {
      final response = await ReportService.getReportedList();
      if (response is InfoResponse) {
        List<ReportModel> tempReport = [];
        for (var data in response.data) {
          tempReport.add(ReportModel.fromJson(data));
        }
        setState(() {
          data = tempReport;
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
    // TODO: implement initState
    super.initState();
    handleReport();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(children: [
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
