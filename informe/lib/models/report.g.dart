// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => ReportModel(
      topic: json['topic'] as String? ?? "",
      status: $enumDecodeNullable(
              _$StatusEnumMap, json['status'].toString().toLowerCase()) ??
          Status.empty,
      description: json['description'] as String? ?? "",
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportModelToJson(ReportModel instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'description': instance.description,
      'course': instance.course,
      'user': instance.user,
      'status': _$StatusEnumMap[instance.status],
    };

const _$StatusEnumMap = {
  Status.sent: 'sent',
  Status.viewed: 'viewed',
  Status.approved: 'approved',
  Status.draft: 'draft',
  Status.empty: 'empty',
};
