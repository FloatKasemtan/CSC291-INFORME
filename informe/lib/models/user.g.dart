// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return User(
    email: json['email'] as String?,
    firstname: json['firstname'] as String?,
    id: json['id'] as String,
    lastname: json['lastname'] as String?,
    userType: $enumDecodeNullable(_$UserTypeEnumMap, json['userType']),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'userType': _$UserTypeEnumMap[instance.userType],
    };

const _$UserTypeEnumMap = {
  UserType.student: 'student',
  UserType.lecturer: 'lecturer',
};
