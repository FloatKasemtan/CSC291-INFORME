import 'package:informe/models/student.dart';
import 'package:informe/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  @JsonKey(required: true)
  String? id;

  String? name;

  String? code;

  User? lecturer;

  String? date;

  String? start;

  String? end;

  List<Student>? students = [];

  Course(
      {this.id,
      this.name,
      this.code,
      this.lecturer,
      this.end,
      this.start,
      this.date,
      this.students = const []});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
