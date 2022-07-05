import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/models/report.dart';
import 'package:informe/models/response/info_response.dart';
import 'package:informe/screens/report_description.dart';
import 'package:informe/screens/report_form.dart';
import 'package:informe/services/constants.dart';
import 'package:informe/services/share_preference.dart';
import 'package:informe/services/utils.dart';
import 'package:informe/widgets/common/alert.dart';

import '../../services/api/report_service.dart';

class ReportCard extends StatelessWidget {
  const ReportCard(
      {Key? key, required this.reportModel, required this.handleReport})
      : super(key: key);
  final ReportModel reportModel;
  final Function handleReport;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => navigateHandler(reportModel, context),
            onLongPress: () {
              if (reportModel.status == Status.draft) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      title: const Text(
                          'Are you sure, you want to delete the form?'),
                      actions: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red[700]),
                            onPressed: () {
                              deleteReportForm(context);
                            },
                            child: const Text('Delete'))
                      ]),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: getColor(reportModel.status.index), width: 5)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(reportModel.topic,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Class: ${reportModel.course.code}",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                    reportModel.status == Status.draft
                        ? Row(
                            children: [
                              const Icon(
                                Icons.edit,
                                size: 18,
                                color: Color(0xffDF2262),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Draft",
                                style: GoogleFonts.poppins(
                                    color: getColor(reportModel.status.index),
                                    fontSize: 16),
                              ),
                            ],
                          )
                        : Text(
                            Utils.capitalize(reportModel.status.name),
                            style: GoogleFonts.poppins(
                                color: getColor(reportModel.status.index),
                                fontSize: 14),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(int i) {
    final colorList = [
      const Color(0xffEA4EE4),
      const Color(0xffE3A951),
      const Color(0xff72Bc8E),
      const Color(0xffDF2262)
    ];
    return colorList[i];
  }

  navigateHandler(ReportModel reportModel, BuildContext context) {
    if (reportModel.status == Status.draft) {
      Navigator.pushNamed(context, ReportForm.routeName,
              arguments: {"reportModel": reportModel})
          .then((value) => handleReport());
    } else {
      onLecturerView(context);
      Navigator.pushNamed(context, ReportInfo.routeName,
              arguments: {"reportModel": reportModel})
          .then((value) => handleReport());
    }
  }

  void onLecturerView(BuildContext context) {
    try {
      if (SharePreference.prefs.getBool(SharePreferenceConstants.isLecturer)! &&
          reportModel.status == Status.sent) {
        ReportService.lecturerView(
            reportModel.id, Utils.getStatus(Status.viewed));
      }
    } on DioError catch (e) {
      Alert.errorAlert(e, context);
    }
  }

  void deleteReportForm(BuildContext context) async {
    try {
      final response = await ReportService.deleteReport(reportModel.id);
      if (response is InfoResponse) {
        Alert.successAlert(response, "Form Deleted", () {
          Navigator.pop(context);
          Navigator.pop(context);
        }, context);
      }
    } on DioError catch (e) {
      Alert.errorAlert(e, context);
    } finally {
      handleReport();
    }
  }
}
