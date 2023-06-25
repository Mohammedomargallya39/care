import 'package:equatable/equatable.dart';

class AiResultsEntity extends Equatable
{
  final BloodTest bloodTest;
  final HeartTest heartTest;
  final AlzhimarTest alzhimarTest;

  AiResultsEntity({
    required this.alzhimarTest,
    required this.heartTest,
    required this.bloodTest
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    alzhimarTest,
    heartTest,
    bloodTest,
  ];
}

class BloodTest extends Equatable
{
  final int id;
  final int age;
  final double bmi;
  final double glucouse;
  final double insuline;
  final double homa;
  final double leptin;
  final double adiponcetin;
  final double resistiin;
  final double mcp;
  final String date;
  final String result;
  final String patient_username;

  BloodTest(
  {
    required this.resistiin,
    required this.mcp,
    required this.leptin,
    required this.insuline,
    required this.homa,
    required this.glucouse,
    required this.bmi,
    required this.adiponcetin,
    required this.result,
    required this.date,
    required this.id,
    required this.age,
    required this.patient_username,
});

    factory BloodTest.fromJson(Map<String,dynamic> json)
    {
      return BloodTest(
          resistiin: json['resistiin'],
          mcp: json['mcp'],
          leptin: json['leptin'],
          insuline: json['insuline'],
          homa: json['homa'],
          glucouse: json['glucouse'],
          bmi: json['bmi'],
          adiponcetin: json['adiponcetin'],
          result: json['result'],
          date: json['date'],
          id: json['id'],
          age: json['age'],
          patient_username: json['patient_username']
      );
    }

  @override
  // TODO: implement props
  List<Object?> get props => [
    resistiin,
    mcp,
    leptin,
    insuline,
    homa,
    glucouse,
    bmi,
    adiponcetin,
    result,
    date,
    id,
    age,
    patient_username,
  ];


}



class HeartTest extends Equatable
{
  final int id;
  final double age;
  final int sex;
  final double chestPainType;
  final double cholesterol;
  final double fastingBS;
  final double maxHR;
  final double exerciseAngina;
  final double oldpeak;
  final double sT_Slope;
  final String date;
  final String result;
  final String patient_username;

  HeartTest(
      {
        required this.sex,
        required this.chestPainType,
        required this.cholesterol,
        required this.fastingBS,
        required this.maxHR,
        required this.exerciseAngina,
        required this.oldpeak,
        required this.sT_Slope,
        required this.result,
        required this.date,
        required this.id,
        required this.age,
        required this.patient_username,
      });

  factory HeartTest.fromJson(Map<String,dynamic> json)
  {
    return HeartTest(
        sex: json['Sex'],
        chestPainType: json['ChestPainType'],
        cholesterol: json['Cholesterol'],
        fastingBS: json['FastingBS'],
        maxHR: json['MaxHR'],
        exerciseAngina: json['ExerciseAngina'],
        oldpeak: json['Oldpeak'],
        sT_Slope: json['ST_Slope'],
        result: json['result'],
        date: json['date'],
        id: json['id'],
        age: json['Age'],
        patient_username: json['patient_username']
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    sex,
    chestPainType,
    cholesterol,
    fastingBS,
    maxHR,
    exerciseAngina,
    oldpeak,
    sT_Slope,
    result,
    date,
    id,
    age,
    patient_username,
  ];


}


class AlzhimarTest extends Equatable
{
  final int id;
  final double age;
  final int gender;
  final double eDUC;
  final double sES;
  final double mMSE;
  final double eTIV;
  final double nWBV;
  final double aSF;
  final String date;
  final String result;
  final String patient_username;

  AlzhimarTest(
      {
        required this.aSF,
        required this.gender,
        required this.eDUC,
        required this.eTIV,
        required this.mMSE,
        required this.nWBV,
        required this.sES,
        required this.result,
        required this.date,
        required this.id,
        required this.age,
        required this.patient_username,
      });

  factory AlzhimarTest.fromJson(Map<String,dynamic> json)
  {
    return AlzhimarTest(
        sES: json['SES'],
        nWBV: json['nWBV'],
        mMSE: json['MMSE'],
        eTIV: json['eTIV'],
        eDUC: json['EDUC'],
        aSF: json['ASF'],
        gender: json['gender'],
        result: json['result'],
        date: json['date'],
        id: json['id'],
        age: json['Age'],
        patient_username: json['patient_username']
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    sES,
    nWBV,
    mMSE,
    eTIV,
    eDUC,
    aSF,
    gender,
    result,
    date,
    id,
    age,
    patient_username,
  ];


}