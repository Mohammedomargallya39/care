import 'package:care/core/error/exceptions.dart';
import 'package:care/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repository/home_base_repository.dart';
import '../data_source/home_remote_data_source.dart';


typedef Call = Future<List<ProfileEntity>> Function();


class HomeRepository extends HomeBaseRepository {
  final HomeBaseDataSource remoteDataSource;

  HomeRepository({
    required this.remoteDataSource,
  });


  Future<Either<Failure, List<ProfileEntity>>> fetchProfile(
      Call mainMethod,
      ) async {
    try {
      final profileData = await mainMethod();
      return Right(profileData);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
      ));
    }
  }

  @override
  Future<Either<Failure, List<ProfileEntity>>> profile({
    required int id,
    bool? isCoach,
  }) async {
    return await fetchProfile(() {
      return remoteDataSource.profile(
        id: id,
      );
    });
  }


}
