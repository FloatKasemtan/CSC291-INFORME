import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informe/models/course.dart';
import 'package:informe/models/report.dart';
import 'package:informe/models/student.dart';
import 'package:informe/models/user.dart';
import 'package:informe/screens/report_form.dart';
import 'package:informe/services/dio.dart';
import 'package:informe/widgets/course_info/expansion_card.dart';

class CourseInfo extends StatefulWidget {
  const CourseInfo({Key? key, this.args}) : super(key: key);
  static const routeName = "/course-info";
  final Map<String, dynamic>? args;

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  late Course course;
  String dropdownValue = 'None';
  @override
  void initState() {
    // TODO: implement initState
    course = Course(
        name: "Hello",
        code: "CSC000",
        students: [
          Student(
            id: "1",
            firstname: "Kasem",
            lastname: "Tevasirichokchai",
            email: "float@mail.com",
            generation: 12,
            tel: "082-123-4567",
            studentId: "63130500237",
            year: 2,
          ),
          Student(
            id: "1",
            firstname: "Kasem1",
            lastname: "Tevasirichokchai",
            email: "float@mail.com",
            generation: 12,
            tel: "082-123-4567",
            studentId: "63130500237",
            year: 2,
          ),
          Student(
            id: "1",
            firstname: "Kasem2",
            lastname: "Tevasirichokchai",
            email: "float@mail.com",
            generation: 12,
            tel: "082-123-4567",
            studentId: "63130500237",
            year: 2,
          ),
          Student(
            id: "1",
            firstname: "Kasem3",
            lastname: "Tevasirichokchai",
            email: "float@mail.com",
            generation: 12,
            tel: "082-123-4567",
            studentId: "63130500237",
            year: 2,
          ),
          Student(
            id: "1",
            firstname: "Kasem4",
            lastname: "Tevasirichokchai",
            email: "float@mail.com",
            generation: 12,
            tel: "082-123-4567",
            studentId: "63130500237",
            year: 2,
          )
        ],
        lecturer: User(
            id: "1",
            firstname: "firstname",
            lastname: "lastname",
            email: "email",
            microsoftTeams: "microsoftTeams",
            tel: "0921325123",
            userType: UserType.lecturer));
    super.initState();
  }

  void moreInfoHandler(Student student) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(
                "ID: ${student.studentId!}",
                style: TextStyle(color: Colors.black),
              ),
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: " + student.firstname! + " " + student.lastname!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .apply(color: Colors.black),
                    ),
                    Text(
                      "Year: " + student.year!.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .apply(color: Colors.black),
                    ),
                    Text(
                      "Generation: " + student.generation!.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .apply(color: Colors.black),
                    ),
                    Text(
                      "Tel: " + student.tel!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .apply(color: Colors.black),
                    ),
                    Text(
                      "Email: " + student.email!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .apply(color: Colors.black),
                    ),
                    Text(
                      "Microsoft Teams: " + student.microsoftTeams!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .apply(color: Colors.black),
                    ),
                  ]),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
              ],
            ));
  }

  void reportHandler(User? user, Course course) {
    Navigator.pushNamed(context, ReportForm.routeName,
        arguments: {"reportModel": ReportModel(user: user!, course: course)});
  }

  List<Widget> buildStudentList() {
    return course.students!.map((student) {
      return ListTile(
        title: Text(student.firstname! + " " + student.lastname!,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .apply(fontSizeDelta: 1.4, fontWeightDelta: 1)),
        subtitle: Text(
          student.studentId!,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        trailing: PopupMenuButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          icon: const Icon(Icons.more_vert),
          color: Colors.white,
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('More Info',
                  style: GoogleFonts.poppins(color: Colors.black)),
              onTap: () {
                Future.delayed(const Duration(seconds: 0), () {
                  moreInfoHandler(student);
                });
              },
            ),
            PopupMenuItem(
              child: Text('Report',
                  style: GoogleFonts.poppins(color: Colors.black)),
              onTap: () {
                Future.delayed(const Duration(seconds: 0), () {
                  reportHandler(student, course);
                });
              },
            )
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // fetch course data using course id

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${course.code}: ${course.name}",
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lecturer",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${course.lecturer!.firstname} ${course.lecturer!.lastname}",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  IconButton(
                      onPressed: () {
                        reportHandler(course.lecturer, course);
                      },
                      icon: const Icon(Icons.flag_rounded))
                ],
              ),
              ExpansionCard(course: course),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Students",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      underline: Container(color: Colors.transparent),
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.black,
                      elevation: 16,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .apply(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['None', 'Name', 'ID']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.filter_list_alt,
                                color: Colors.black,
                              ),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        colors: [Color(0xff273870), Color(0xff1D284E)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: Column(
                  children: buildStudentList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
