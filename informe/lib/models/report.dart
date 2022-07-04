import 'package:informe/models/course.dart';
import 'package:informe/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable()
class ReportModel {
  String id = "";
  String topic = "";
  String description = "";
  final Course course;
  final User user;
  Status status;

  ReportModel(
      {this.id = "",
      this.topic = "",
      this.status = Status.empty,
      this.description = "",
      required this.course,
      required this.user});

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);
}

enum Status { sent, viewed, approved, draft, empty }
