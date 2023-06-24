import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/doctor_profile_entity.dart';
import '../repository/home_base_repository.dart';

class BookAppointmentUseCase implements UseCase<void, BookAppointmentParams> {
  final HomeBaseRepository repository;

  BookAppointmentUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(
      BookAppointmentParams params) async {
    return await repository.bookAppointment(
      id: params.id,
      date: params.date,
      time: params.time,
    );
  }
}

class BookAppointmentParams extends Equatable {
  final int id;
  final String date;
  final String time;


  const BookAppointmentParams({
    required this.id,
    required this.date,
    required this.time,
  });

  @override
  List<Object> get props => [
    id,
    date,
    time,
  ];
}
