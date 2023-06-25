import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/get_labs_entity.dart';
import '../repository/home_base_repository.dart';

class GetLabsUseCase implements UseCase<List<GetLabsEntity>, GetLabsParams> {
  final HomeBaseRepository repository;

  GetLabsUseCase(this.repository);

  @override
  Future<Either<Failure, List<GetLabsEntity>>> call(
      GetLabsParams params) async {
    return await repository.getLabs();
  }
}

class GetLabsParams extends Equatable {

  const GetLabsParams();

  @override
  List<Object> get props => [
  ];
}
