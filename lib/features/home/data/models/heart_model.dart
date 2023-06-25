import 'package:care/features/home/domain/entities/blood_check_entity.dart';

import '../../domain/entities/heart_entity.dart';

class HeartCheckModel extends HeartCheckEntity
{
  HeartCheckModel(
      {
        required super.result,
      });

  factory HeartCheckModel.fromJson(Map<String,dynamic> json)
  {
    return HeartCheckModel(
      result: json['response'],
    );
  }

}