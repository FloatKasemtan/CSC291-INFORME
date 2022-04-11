import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/models/report.dart';
import 'package:informe/services/utils.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key, required this.reportModel}) : super(key: key);
  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: reportModel.status == Status.draft ? () {} : null,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(reportModel.topic,
                            style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Class: ${reportModel.atclass}",
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
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
                                fontSize: 16),
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
}
