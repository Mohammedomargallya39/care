import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/register_entity.dart';

abstract class RegisterBaseRepository {
  Future<Either<Failure, RegisterEntity>> register({
    required String userName,
    required String email,
    required File profilePicture,
    required String password,
  });
}