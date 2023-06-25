import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/alzhaimer_entity.dart';
import '../repository/home_base_repository.dart';

class AlzahimarCheckUseCase implements UseCase<AlzahimarCheckEntity, AlzahimarCheckParams> {
  final HomeBaseRepository repository;

  AlzahimarCheckUseCase(this.repository);

  @override
  Future<Either<Failure, AlzahimarCheckEntity>> call(
      AlzahimarCheckParams params) async {
    return await repository.alzahimarCheck(
      age: params.age,
      gender: params.gender,
      eDUC: params.eDUC,
      sES: params.sES,
      mMSE: params.mMSE,
      eTIV: params.eTIV,
      nWBV: params.nWBV,
      aSF: params.aSF,

    );
  }
}

class AlzahimarCheckParams extends Equatable {
  final int age;
  final int gender;
  final int eDUC;
  final int sES;
  final int eTIV;
  final int mMSE;
  final int nWBV;
  final int aSF;



  const AlzahimarCheckParams({
    required this.age,
    required this.gender,
    required this.eDUC,
    required this.sES,
    required this.eTIV,
    required this.mMSE,
    required this.nWBV,
    required this.aSF,
  });

  @override
  List<Object> get props => [
    age,
    gender,
    eDUC,
    sES,
    eTIV,
    mMSE,
    nWBV,
    aSF,
  ];
}
