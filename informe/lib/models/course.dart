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

  String? start;

  String? end;

  Course({this.id, this.name, this.code, this.lecturer, this.end, this.start});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
