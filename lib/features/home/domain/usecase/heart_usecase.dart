import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/heart_entity.dart';
import '../repository/home_base_repository.dart';

class HeartCheckUseCase implements UseCase<HeartCheckEntity, HeartCheckParams> {
  final HomeBaseRepository repository;

  HeartCheckUseCase(this.repository);

  @override
  Future<Either<Failure, HeartCheckEntity>> call(
      HeartCheckParams params) async {
    return await repository.heartCheck(
      age: params.age,
      sex: params.sex,
      chestPainType: params.chestPainType,
      cholesterol: params.cholesterol,
      fastingBS: params.fastingBS,
      maxHR: params.maxHR,
      exerciseAngina: params.exerciseAngina,
      oldpeak: params.oldpeak,
      sT_Slope: params.sT_Slope,

    );
  }
}

class HeartCheckParams extends Equatable {
  final int age;
  final int sex;
  final int chestPainType;
  final int cholesterol;
  final int fastingBS;
  final int exerciseAngina;
  final int maxHR;
  final int oldpeak;
  final int sT_Slope;



  const HeartCheckParams({
    required this.age,
    required this.sex,
    required this.chestPainType,
    required this.cholesterol,
    required this.fastingBS,
    required this.exerciseAngina,
    required this.maxHR,
    required this.oldpeak,
    required this.sT_Slope

  });

  @override
  List<Object> get props => [
    age,
    sex,
    chestPainType,
    cholesterol,
    fastingBS,
    exerciseAngina,
    maxHR,
    oldpeak,
    sT_Slope,
  ];
}
