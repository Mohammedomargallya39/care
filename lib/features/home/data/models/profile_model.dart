import 'package:care/features/home/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity
{
  ProfileModel(
  {
    required super.id,
    required super.userName,
    required super.email,
    required super.profilePic,
    required super.isDoctor
});

  factory ProfileModel.fromJson(Map<String,dynamic> json)
  {
    return ProfileModel(
        id: json['id'],
        userName: json['username'],
        email: json['email'],
        profilePic: json['profile_pic'],
        isDoctor: json['is_doctor']
    );
  }

}