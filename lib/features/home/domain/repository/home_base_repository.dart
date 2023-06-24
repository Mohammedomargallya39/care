import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/doctor_profile_entity.dart';
import '../entities/get_appointment_entity.dart';
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


}
