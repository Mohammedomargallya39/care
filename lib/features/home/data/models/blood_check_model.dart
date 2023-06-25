import 'package:care/features/home/domain/entities/blood_check_entity.dart';

class BloodCheckModel extends BloodCheckEntity
{
  BloodCheckModel(
      {
        required super.result,
      });

  factory BloodCheckModel.fromJson(Map<String,dynamic> json)
  {
    return BloodCheckModel(
      result: json['response'],
    );
  }

}