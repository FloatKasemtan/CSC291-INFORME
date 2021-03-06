import 'package:informe/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student extends User {
  Student(
      {required String id,
      String? email = "",
      String? firstname = "",
      String? lastname = "",
      String? microsoftTeams = "",
      String? tel = "",
      this.generation,
      this.studentId,
      this.year,
      required this.banchelor})
      : super(
            id: id,
            email: email,
            firstname: firstname,
            lastname: lastname,
            microsoftTeams: microsoftTeams,
            tel: tel,
            userType: UserType.student);
  String? studentId;
  int? year;
  String? generation;
  String banchelor;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
