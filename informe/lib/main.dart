import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/screens/course_info.dart';
import 'package:informe/screens/courses.dart';
import 'package:informe/screens/get_start.dart';
import 'package:informe/screens/home.dart';
import 'package:informe/screens/report.dart';
import 'package:informe/screens/report_form.dart';
import 'package:informe/screens/schedule.dart';
import 'package:informe/screens/sign_in.dart';
import 'package:informe/services/dio.dart';
import 'package:informe/services/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp(),
    ),
  );
  // DioInstance().init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
          ),
          bodyText2: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      routes: {
        '/': (context) => Home(),
        SignIn.routeName: (context) => SignIn(),
        GetStart.routeName: (context) => GetStart(),
        Home.routeName: (context) => Home(),
        Courses.routeName: (context) => Courses(),
        CourseInfo.routeName: (context) => CourseInfo(),
        Schedule.routeName: (context) => Schedule(),
        Report.routeName: (context) => Report(),
        ReportForm.routeName: (context) => ReportForm(),
      },
    );
  }
}
