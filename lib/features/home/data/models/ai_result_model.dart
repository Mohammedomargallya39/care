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
        alzhimarTest: AlzhimarTest.fromJson(json['alzhimarTest']),
        bloodTest: BloodTest.fromJson(json['bloodTest']),
        heartTest: HeartTest.fromJson(json['heartTest']),
    );
  }
  
}