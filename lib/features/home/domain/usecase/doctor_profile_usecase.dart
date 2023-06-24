import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/doctor_profile_entity.dart';
import '../repository/home_base_repository.dart';

class DoctorProfileUseCase implements UseCase<List<DoctorProfileEntity>, DoctorProfileParams> {
  final HomeBaseRepository repository;

  DoctorProfileUseCase(this.repository);

  @override
  Future<Either<Failure, List<DoctorProfileEntity>>> call(
      DoctorProfileParams params) async {
    return await repository.doctorProfile(
      id: params.id,
    );
  }
}

class DoctorProfileParams extends Equatable {
  final int id;


  const DoctorProfileParams({
    required this.id,
  });

  @override
  List<Object> get props => [
    id,
  ];
}
