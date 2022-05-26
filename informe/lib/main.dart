import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/models/report.dart';
import 'package:informe/screens/course_info.dart';
import 'package:informe/widgets/courses.dart';
import 'package:informe/screens/get_start.dart';
import 'package:informe/widgets/home.dart';
import 'package:informe/widgets/report.dart';
import 'package:informe/screens/report_form.dart';
import 'package:informe/widgets/schedule.dart';
import 'package:informe/screens/sign_in.dart';
import 'package:informe/services/dio.dart';
import 'package:informe/services/provider.dart';
import 'package:informe/widgets/common/navigation_bar.dart';
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
  DioInstance.init();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> screen = <Widget>[
    const Home(),
    const Courses(),
    const Schedule(),
    Report(data: [
      ReportModel("xxxxxx", "CSCxxx", Status.sent),
      ReportModel("xxxxxx", "CSCxxx", Status.viewed),
      ReportModel("xxxxxx", "CSCxxx", Status.approved),
      ReportModel("xxxxxx", "CSCxxx", Status.draft),
      ReportModel("xxxxxx", "CSCxxx", Status.sent),
      ReportModel("xxxxxx", "CSCxxx", Status.viewed),
      ReportModel("xxxxxx", "CSCxxx", Status.approved),
      ReportModel("xxxxxx", "CSCxxx", Status.draft),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            labelMedium: GoogleFonts.poppins(color: Colors.black, fontSize: 18),
            bodyText1: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
            ),
            bodyText2: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            headline1: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
      ),
      routes: {
        "/": (context) => Scaffold(
              // appBar: AppBar(),
              backgroundColor: const Color(0xFF161D3A),
              body: screen.elementAt(_selectedIndex),
              bottomNavigationBar: CustomNavigatorBar(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
              ),
            ),
        "/landing": (context) => Scaffold(
              // appBar: AppBar(),
              backgroundColor: const Color(0xFF161D3A),
              body: screen.elementAt(_selectedIndex),
              bottomNavigationBar: CustomNavigatorBar(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
              ),
            ),
        CourseInfo.routeName: (context) => CourseInfo(
            args: ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>),
        SignIn.routeName: (context) => SignIn(),
        GetStart.routeName: (context) => GetStart(),
        ReportForm.routeName: (context) => ReportForm(
            args: ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>),
      },
    );
  }
}
