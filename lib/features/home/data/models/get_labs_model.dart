import 'package:care/features/home/domain/entities/profile_entity.dart';

import '../../domain/entities/get_labs_entity.dart';

class GetLabsModel extends GetLabsEntity
{
  GetLabsModel(
      {
        required super.id,
        required super.labAddress,
        required super.labCountry,
        required super.labEmail,
        required super.labEndTime,
        required super.labName,
        required super.labPhone,
        required super.labStartTime,
      });

  factory GetLabsModel.fromJson(Map<String,dynamic> json)
  {
    return GetLabsModel(
        id: json['id'],
        labAddress: json['lab_address'],
        labCountry: json['lab_country'],
        labEmail: json['lab_email'],
        labEndTime: json['work_time_to'],
        labName: json['lab_name'],
        labPhone: json['lab_phone'],
        labStartTime: json['work_time_from'],
    );
  }

}