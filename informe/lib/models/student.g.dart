// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return Student(
    id: json['user']['id'] as String,
    email: json['user']['email'] as String? ?? "",
    firstname: json['user']['firstname'] as String? ?? "",
    lastname: json['user']['lastname'] as String? ?? "",
    microsoftTeams: json['user']['microsoftTeams'] ?? "",
    tel: json['user']['tel'] as String? ?? "",
    generation: json['generation'] as String?,
    studentId: json['student_id'] as String?,
    year: json['year'] as int?,
    banchelor: json['banchelor'] as String,
  )..userType = $enumDecodeNullable(_$UserTypeEnumMap, json['userType']);
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'userType': _$UserTypeEnumMap[instance.userType],
      'tel': instance.tel,
      'microsoftTeams': instance.microsoftTeams,
      'studentId': instance.studentId,
      'year': instance.year,
      'generation': instance.generation,
      'banchelor': instance.banchelor,
    };

const _$UserTypeEnumMap = {
  UserType.student: 'student',
  UserType.lecturer: 'lecturer',
};
