import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/models/course.dart';
import 'package:informe/screens/course_info.dart';

class CardCourse extends StatelessWidget {
  const CardCourse({Key? key, required this.course, required this.index})
      : super(key: key);
  final Course course;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          Navigator.pushNamed(context, CourseInfo.routeName, arguments: {
            "id": course.id,
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
              // margin: const EdgeInsets.symmetric(vertical: 10.0),
              // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                gradient: getGradient(index % 6),
                // borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    right: -50,
                    top: -50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${course.date} ${course.start} - ${course.end}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: getColor(index % 2)),
                                  ),
                                  Text(
                                    '${course.code} : ${course.name}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                        color: getColor(index % 2)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Ajarn : ${course.lecturer?.firstname} ${course.lecturer?.lastname}',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: getColor(index % 2)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          // Positioned(
          //   child: Container(
          //     color: Colors.white,
          //     width: 100,
          //     height: 100,
          //   ),
          //   right: 0,
          // ),
        ),
      ),
    );
    // return Padding(
    //   // decoration: BoxDecoration(gradient: getGradient(index % 6)),
    //   padding: const EdgeInsets.symmetric(vertical: 10),
    //   child: Card(
    //     color: Colors.white,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     child: Container(
    //         decoration: BoxDecoration(gradient: getGradient(index % 6))),
    //     // child: SizedBox(
    //     //   width: 300,
    //     //   height: 100,
    //     // ),
    //     // child: Text("${course.start}"),
    //   ),
    // );
  }

  Color getColor(int i) {
    final colorList = [
      Colors.black,
      Colors.white,
    ];
    return colorList[i];
  }

  LinearGradient getGradient(int i) {
    final linearGradientList = [
      const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xffFF1368),
          Color(0xffFF6464),
        ],
      ),
      const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xffFEAB02),
          Color(0xffFE8817),
        ],
      ),
      const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xffFFF06C),
          Color(0xffFCFF5B),
        ],
      ),
      const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xff1A934A),
          Color(0xff4ED193),
        ],
      ),
      const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xff0368FF),
          Color(0xff69C9F2),
        ],
      ),
      const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xff5A26ED),
          Color(0xff9B67CD),
        ],
      ),
    ];
    return linearGradientList[i];
  }
}
