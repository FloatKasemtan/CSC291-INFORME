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
    id: json['id'] as String,
    email: json['email'] as String? ?? "",
    firstname: json['firstname'] as String? ?? "",
    lastname: json['lastname'] as String? ?? "",
    microsoftTeams: json['microsoftTeams'] as String? ?? "",
    tel: json['tel'] as String? ?? "",
    generation: json['generation'] as int?,
    studentId: json['studentId'] as String?,
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
