import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repository/register_base_rebository.dart';
import '../data_source/register_remote_data_source.dart';

typedef Call = Future<RegisterEntity> Function();

class RegisterRepoImplementation extends RegisterBaseRepository {
  final RegisterBaseRemoteDataSource remoteDataSource;

  RegisterRepoImplementation({
    required this.remoteDataSource,
  });

  Future<Either<Failure, RegisterEntity>> fetchData(
      Call mainMethod,
      ) async {
    try {
      final registerData = await mainMethod();
      return Right(registerData);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
      ));
    }
  }

  @override
  Future<Either<Failure, RegisterEntity>> register(
      {
        required String userName,
        required String email,
        required File profilePicture,
        required String password,

      }) async {
    return await fetchData(()
    {
      return remoteDataSource.register(
        userName: userName,
        password: password,
        email: email,
        profilePicture: profilePicture,
      );
    });
  }
}

