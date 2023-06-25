import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../core/network/remote/api_endpoints.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../models/register_model.dart';

abstract class RegisterBaseRemoteDataSource {
  Future<RegisterModel> register({
    required String userName,
    required String email,
    required File profilePicture,
    required String password,
  });
}

class RegisterRemoteDataSourceImpl
    implements RegisterBaseRemoteDataSource {
  final DioHelper dioHelper;

  RegisterRemoteDataSourceImpl({
    required this.dioHelper,
  });

  @override
  Future<RegisterModel> register({
    required String userName,
    required String email,
    required File profilePicture,
    required String password,

  }) async {
    final Response f = await dioHelper.post(
      url: registerEndPoint,
      data: FormData.fromMap(
          {
            'username': userName,
            'email': email,
            'profile_pic': await MultipartFile.fromFile(
              profilePicture.path,
              filename: Uri.file(profilePicture.path).pathSegments.last,
            ),
            'password': password,
          }
      ),
      isMultipart: true,
    );
    return RegisterModel.fromJson(f.data);
  }
}

