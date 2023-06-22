import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable
{
  int id;
  String userName;
  String email;
  String profilePic;
  bool isDoctor;

  ProfileEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.profilePic,
    required this.isDoctor,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    userName,
    email,
    profilePic,
    isDoctor,
  ];
}