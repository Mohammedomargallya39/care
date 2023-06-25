import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/ai_result_entity.dart';
import '../repository/home_base_repository.dart';

class AiResultsUseCase implements UseCase<AiResultsEntity, AiResultsParams> {
  final HomeBaseRepository repository;

  AiResultsUseCase(this.repository);

  @override
  Future<Either<Failure, AiResultsEntity>> call(
      AiResultsParams params) async {
    return await repository.aiResults(
      id: params.id,
    );
  }
}

class AiResultsParams extends Equatable {
  final int id;


  const AiResultsParams({
    required this.id,
  });

  @override
  List<Object> get props => [
    id
  ];
}
