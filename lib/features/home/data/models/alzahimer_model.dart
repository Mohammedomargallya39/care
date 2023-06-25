import 'package:care/features/home/domain/entities/blood_check_entity.dart';

import '../../domain/entities/alzhaimer_entity.dart';

class AlzahimarCheckModel extends AlzahimarCheckEntity
{
  AlzahimarCheckModel(
      {
        required super.result,
      });

  factory AlzahimarCheckModel.fromJson(Map<String,dynamic> json)
  {
    return AlzahimarCheckModel(
      result: json['response'],
    );
  }

}