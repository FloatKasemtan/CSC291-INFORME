import 'package:informe/models/report.dart';
import 'package:informe/services/utils.dart';

class CreateReportModel {
  final String topic;
  final String description;
  final String userReportedId;
  final String courseId;
  Status? status;

  CreateReportModel(
      {required this.topic,
      required this.description,
      required this.userReportedId,
      required this.courseId,
      this.status = Status.empty});

  factory CreateReportModel.fromReport(ReportModel report) {
    return CreateReportModel(
      topic: report.topic,
      description: report.description,
      userReportedId: report.user!.id,
      courseId: report.course!.id!,
      status: report.status,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'topic': topic,
      'description': description,
      'user_reported_id': userReportedId,
      'course_id': courseId,
      'status': Utils.getStatus(status!),
    };
  }
}
