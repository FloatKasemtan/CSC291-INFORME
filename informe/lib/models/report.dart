class ReportModel {
  final String topic;
  final String atclass;
  final Status status;
  ReportModel(this.topic, this.atclass, this.status);
}

enum Status { sent, viewed, approved, draft }
