import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/register_entity.dart';
import '../repository/register_base_rebository.dart';

class RegisterUseCase
    implements UseCase<RegisterEntity, RegisterParams> {
  final RegisterBaseRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, RegisterEntity>> call(
      RegisterParams params) async {
    return await repository.register(
      userName: params.userName,
      password: params.password,
      email: params.email,
      profilePicture: params.profilePicture,
    );
  }
}

class RegisterParams extends Equatable {
  final String userName;
  final String email;
  final File profilePicture;
  final String password;


  const  RegisterParams({
    required this.userName,
    required this.email,
    required this.profilePicture,
    required this.password,
  });

  @override
  List<Object> get props => [
    userName,
    password,
    email,
    profilePicture,
  ];
}
