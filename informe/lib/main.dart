import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/models/course.dart';
import 'package:informe/models/report.dart';
import 'package:informe/models/response/error_response.dart';
import 'package:informe/models/response/info_response.dart';
import 'package:informe/models/user.dart';
import 'package:informe/screens/course_info.dart';
import 'package:informe/screens/report_description.dart';
import 'package:informe/services/api/report_service.dart';
import 'package:informe/services/constants.dart';
import 'package:informe/services/share_preference.dart';
import 'package:informe/widgets/common/alert.dart';
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
    ///
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp(),
    ),
  );
  SharePreference.init();
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
  late List<ReportModel> reports = [];
  late bool reportLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> screen = <Widget>[
    const Home(),
    const Courses(),
    const Schedule(),
    const Report(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
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
            subtitle1: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
            ),
            headline2: GoogleFonts.poppins(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
            headline1: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
      ),
      routes: {
        "/": (context) => const GetStart(),
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
        SignIn.routeName: (context) => const SignIn(),
        GetStart.routeName: (context) => GetStart(),
        ReportForm.routeName: (context) => ReportForm(
            args: ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>),
        ReportInfo.routeName: (context) => ReportInfo(
            args: ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>)
      },
    );
  }
}
