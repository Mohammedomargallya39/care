import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/ai_result_entity.dart';
import '../entities/alzhaimer_entity.dart';
import '../entities/blood_check_entity.dart';
import '../entities/doctor_profile_entity.dart';
import '../entities/get_appointment_entity.dart';
import '../entities/get_labs_entity.dart';
import '../entities/heart_entity.dart';
import '../entities/profile_entity.dart';

abstract class HomeBaseRepository {

  Future<Either<Failure, List<ProfileEntity>>> profile({
    required int id,
  });

  Future<Either<Failure, List<ProfileEntity>>> doctor({
    required bool isDoctor,
  });

  Future<Either<Failure, List<DoctorProfileEntity>>> doctorProfile({
    required int id,
  });

  Future<Either<Failure, void>> bookAppointment({
    required int id,
    required String date,
    required String time,
  });

  Future<Either<Failure, List<GetAppointmentEntity>>> getAppointment();

  Future<Either<Failure, List<GetLabsEntity>>> getLabs();


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
  });

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
  });


  Future<Either<Failure, AlzahimarCheckEntity>> alzahimarCheck({
    required int age,
    required int gender,
    required int eDUC,
    required int sES,
    required int eTIV,
    required int mMSE,
    required int nWBV,
    required int aSF,
  });

  Future<Either<Failure, AiResultsEntity>> aiResults({
    required int id,
  });


}
