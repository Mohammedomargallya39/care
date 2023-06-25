import 'package:care/core/error/exceptions.dart';
import 'package:care/core/error/failures.dart';
import 'package:care/features/home/domain/entities/alzhaimer_entity.dart';
import 'package:care/features/home/domain/entities/blood_check_entity.dart';
import 'package:care/features/home/domain/entities/get_appointment_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/doctor_profile_entity.dart';
import '../../domain/entities/get_labs_entity.dart';
import '../../domain/entities/heart_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repository/home_base_repository.dart';
import '../data_source/home_remote_data_source.dart';


typedef Call = Future<List<ProfileEntity>> Function();
typedef CallDoctorProfile = Future<List<DoctorProfileEntity>> Function();
typedef BookAppointment = Future<void> Function();
typedef BloodCheck = Future<BloodCheckEntity> Function();
typedef HeartCheck = Future<HeartCheckEntity> Function();
typedef AlzhaimerCheck = Future<AlzahimarCheckEntity> Function();
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


  Future<Either<Failure, BloodCheckEntity>> fetchBloodCheck(
      BloodCheck mainMethod,
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
  Future<Either<Failure, BloodCheckEntity>> bloodCheck({
    required int age,
    required int bmi,
    required int glucouse,
    required int insuline,
    required int homa,
    required int leptin,
    required int adiponcetin,
    required int resistiin,
    required int mcp,
}) async {
    return await fetchBloodCheck(() {
      return remoteDataSource.bloodCheck(
        age: age,
        adiponcetin: adiponcetin,
        bmi: bmi,
        glucouse: glucouse,
        homa: homa,
        insuline: insuline,
        leptin: leptin,
        mcp: mcp,
        resistiin: resistiin,
      );
    });
  }



  Future<Either<Failure, HeartCheckEntity>> fetchHeartCheck(
      HeartCheck mainMethod,
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
  Future<Either<Failure, HeartCheckEntity>> heartCheck({
    required int age,
    required int sex,
    required int chestPainType,
    required int cholesterol,
    required int fastingBS,
    required int exerciseAngina,
    required int maxHR,
    required int oldpeak,
    required int sT_Slope,
  }) async {
    return await fetchHeartCheck(() {
      return remoteDataSource.heartCheck(
        age: age,
        sex: sex,
        chestPainType: chestPainType,
        cholesterol: cholesterol,
        fastingBS: fastingBS,
        exerciseAngina: exerciseAngina,
        maxHR: maxHR,
        oldpeak: oldpeak,
        sT_Slope: sT_Slope,
      );
    });
  }


  Future<Either<Failure, AlzahimarCheckEntity>> fetchAlzahimarCheck(
      AlzhaimerCheck mainMethod,
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
  Future<Either<Failure, AlzahimarCheckEntity>> alzahimarCheck({
    required int age,
    required int gender,
    required int eDUC,
    required int sES,
    required int eTIV,
    required int mMSE,
    required int nWBV,
    required int aSF,
  }) async {
    return await fetchAlzahimarCheck(() {
      return remoteDataSource.alzahimarCheck(
        age: age,
        gender: gender,
        eDUC: eDUC,
        sES: sES,
        eTIV: eTIV,
        mMSE: mMSE,
        nWBV: nWBV,
        aSF: aSF,
      );
    });
  }

}
