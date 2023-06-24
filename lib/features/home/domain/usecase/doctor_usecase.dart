import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/profile_entity.dart';
import '../repository/home_base_repository.dart';

class DoctorUseCase implements UseCase<List<ProfileEntity>, DoctorParams> {
  final HomeBaseRepository repository;

  DoctorUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProfileEntity>>> call(
      DoctorParams params) async {
    return await repository.doctor(
      isDoctor: params.isDoctor,
    );
  }
}

class DoctorParams extends Equatable {
  final bool isDoctor;


  const DoctorParams({
    required this.isDoctor,
  });

  @override
  List<Object> get props => [
    isDoctor,
  ];
}
