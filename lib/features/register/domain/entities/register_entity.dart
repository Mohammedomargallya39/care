import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final ResponseData responseData;
  final String token;

  const RegisterEntity({
    required this.responseData,
    required this.token,
  });

  @override
  List<Object?> get props => [
        token,
        responseData,
      ];
}

class ResponseData extends Equatable
{
  final int id;
  final String userName;
  final String email;
  final bool isDoctor;
  const ResponseData({
    required this.id,
    required this.userName,
    required this.email,
    required this.isDoctor,
});

  factory ResponseData.fromJson(Map<String,dynamic> json)
  {
    return ResponseData(
        id: json['id'],
        userName: json['username'],
        email: json['email'],
        isDoctor: json['is_doctor']
    );
  }

  @override
  List<Object?> get props => [
    id,
    userName,
    email,
    isDoctor,
  ];
}
