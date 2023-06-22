import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/profile_entity.dart';

abstract class HomeBaseRepository {

  Future<Either<Failure, List<ProfileEntity>>> profile({
    required int id,
  });

}
