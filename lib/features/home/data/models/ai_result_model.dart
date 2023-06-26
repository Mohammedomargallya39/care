import 'package:care/features/home/domain/entities/ai_result_entity.dart';

class AiResultsModel extends AiResultsEntity 
{
  AiResultsModel(
  {
    required super.alzhimarTest,
    required super.bloodTest,
    required super.heartTest,
});
  
  factory AiResultsModel.fromJson(Map<String,dynamic> json) 
  {
    return AiResultsModel(
        alzhimarTest: json['alzhimarTest'] == null ? null : AlzhimarTest.fromJson(json['alzhimarTest']),
        bloodTest: json['bloodTest'] == null ? null : BloodTest.fromJson(json['bloodTest']),
        heartTest: json['heartTest'] == null ? null : HeartTest.fromJson(json['heartTest']),
    );
  }
  
}