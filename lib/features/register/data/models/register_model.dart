import '../../domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.token,
    required super.responseData
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      responseData: ResponseData.fromJson(json['Response']),
      token: json['token'],
    );
  }
}
