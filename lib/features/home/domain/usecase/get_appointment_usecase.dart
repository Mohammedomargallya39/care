import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/get_appointment_entity.dart';
import '../repository/home_base_repository.dart';

class GetAppointmentUseCase implements UseCase<List<GetAppointmentEntity>, GetAppointmentParams> {
  final HomeBaseRepository repository;

  GetAppointmentUseCase(this.repository);

  @override
  Future<Either<Failure, List<GetAppointmentEntity>>> call(
      GetAppointmentParams params) async {
    return await repository.getAppointment();
  }
}

class GetAppointmentParams extends Equatable {

  const GetAppointmentParams();

  @override
  List<Object> get props => [
  ];
}
