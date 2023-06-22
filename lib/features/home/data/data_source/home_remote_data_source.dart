import 'package:care/core/network/remote/api_endpoints.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/remote/dio_helper.dart';
import '../models/profile_model.dart';

abstract class HomeBaseDataSource {

  Future <List<ProfileModel>> profile ({
    required int id,
});

}

class HomeDataSourceImpl implements HomeBaseDataSource {
  final DioHelper dioHelper;

  HomeDataSourceImpl({
    required this.dioHelper,
  });

  @override
  Future<List<ProfileModel>> profile({
    required int id,
}) async
  {
    final Response f = await dioHelper.get(
        url: '$registerEndPoint?id=$id'
    );
    return List<ProfileModel>.from(
        (f.data['results'] as List).map((e) => ProfileModel.fromJson(e)));
    //ProfileModel.fromJson(f.data);
  }

}
