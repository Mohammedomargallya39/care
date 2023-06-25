import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/blood_check_entity.dart';
import '../repository/home_base_repository.dart';

class BloodCheckUseCase implements UseCase<BloodCheckEntity, BloodCheckParams> {
  final HomeBaseRepository repository;

  BloodCheckUseCase(this.repository);

  @override
  Future<Either<Failure, BloodCheckEntity>> call(
      BloodCheckParams params) async {
    return await repository.bloodCheck(
      age: params.age,
      bmi: params.bmi,
      glucouse: params.glucouse,
      insuline: params.insuline,
      homa: params.homa,
      leptin: params.leptin,
      adiponcetin: params.adiponcetin,
      resistiin: params.resistiin,
      mcp: params.mcp,

    );
  }
}

class BloodCheckParams extends Equatable {
  final int age;
  final int bmi;
  final int glucouse;
  final int insuline;
  final int homa;
  final int leptin;
  final int adiponcetin;
  final int resistiin;
  final int mcp;



  const BloodCheckParams({
    required this.age,
    required this.adiponcetin,
    required this.bmi,
    required this.glucouse,
    required this.homa,
    required this.insuline,
    required this.leptin,
    required this.mcp,
    required this.resistiin

  });

  @override
  List<Object> get props => [
    age,
    adiponcetin,
    bmi,
    glucouse,
    homa,
    insuline,
    leptin,
    mcp,
    resistiin,
  ];
}
