import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  String email;
  String token;
  int userId;

  LoginEntity({
    required this.email,
    required this.token,
    required this.userId,
  });

  @override
  List<Object?> get props => [
        email,
        token,
        userId,
      ];
}
