import 'package:dio/dio.dart';
import '../../../../core/network/remote/api_endpoints.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../models/login_model.dart';

abstract class LogInBaseRemoteDataSource {
  Future<LogInModel> logIn({
    required String userName,
    required String password,
  });
}

class LogInRemoteDataSourceImpl
    implements LogInBaseRemoteDataSource {
  final DioHelper dioHelper;

  LogInRemoteDataSourceImpl({
    required this.dioHelper,
  });

  @override
  Future<LogInModel> logIn({
    required String userName,
    required String password,
  }) async {
    final Response f = await dioHelper.post(
        url: logInEndPoint,
        data: {
          'username':userName,
          'password':password,
        }
    );
    return LogInModel.fromJson(f.data);
  }
}