import 'package:care/core/error/exceptions.dart';
import 'package:care/core/error/failures.dart';
import 'package:care/features/home/domain/entities/get_appointment_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/doctor_profile_entity.dart';
import '../../domain/entities/get_labs_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repository/home_base_repository.dart';
import '../data_source/home_remote_data_source.dart';


typedef Call = Future<List<ProfileEntity>> Function();
typedef CallDoctorProfile = Future<List<DoctorProfileEntity>> Function();
typedef BookAppointment = Future<void> Function();
typedef GetAppointment = Future<List<GetAppointmentEntity>> Function();
typedef GetLabs = Future<List<GetLabsEntity>> Function();


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
  }) async {
    return await fetchProfile(() {
      return remoteDataSource.profile(
        id: id,
      );
    });
  }

  @override
  Future<Either<Failure, List<ProfileEntity>>> doctor({
    required bool isDoctor,
  }) async {
    return await fetchProfile(() {
      return remoteDataSource.doctor(
        isDoctor: isDoctor,
      );
    });
  }


  Future<Either<Failure, List<DoctorProfileEntity>>> fetchDoctorProfile(
      CallDoctorProfile mainMethod,
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
  Future<Either<Failure, List<DoctorProfileEntity>>> doctorProfile({
    required int id,
  }) async {
    return await fetchDoctorProfile(() {
      return remoteDataSource.doctorProfile(
        id: id,
      );
    });
  }



  Future<Either<Failure, void>> fetchBookAppointment(
      BookAppointment mainMethod,
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
  Future<Either<Failure, void>> bookAppointment({
    required int id,
    required String date,
    required String time,
  }) async {
    return await fetchBookAppointment(() {
      return remoteDataSource.bookAppointment(
        id: id,
        date: date,
        time: time,
      );
    });
  }



  Future<Either<Failure, List<GetAppointmentEntity>>> fetchGetAppointment(
      GetAppointment mainMethod,
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
  Future<Either<Failure, List<GetAppointmentEntity>>> getAppointment() async {
    return await fetchGetAppointment(() {
      return remoteDataSource.getAppointment();
    });
  }


  Future<Either<Failure, List<GetLabsEntity>>> fetchGetLabs(
      GetLabs mainMethod,
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
  Future<Either<Failure, List<GetLabsEntity>>> getLabs() async {
    return await fetchGetLabs(() {
      return remoteDataSource.getLabs();
    });
  }

}
