// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return Course(
    id: json['id'] as String?,
    name: json['name'] as String?,
    code: json['code'] as String?,
    lecturer: json['lecturer'] == null
        ? null
        : User.fromJson(json['lecturer'] as Map<String, dynamic>),
    end: json['end'] as String?,
    start: json['start'] as String?,
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'lecturer': instance.lecturer,
      'start': instance.start,
      'end': instance.end,
    };
