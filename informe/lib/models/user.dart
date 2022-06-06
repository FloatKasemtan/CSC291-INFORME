import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(required: true)
  String id;

  String? firstname;

  String? lastname;

  String? email;

  UserType? userType;

  String? tel;

  String? microsoftTeams;

  User(
      {this.email,
      this.firstname,
      required this.id,
      this.lastname,
      this.userType,
      this.microsoftTeams,
      this.tel});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

enum UserType { student, lecturer }
