import 'package:care/core/network/remote/api_endpoints.dart';
import 'package:care/core/util/resources/constants_manager.dart';
import 'package:care/features/home/data/models/alzahimer_model.dart';
import 'package:care/features/home/data/models/blood_check_model.dart';
import 'package:care/features/home/data/models/get_appointment_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/remote/dio_helper.dart';
import '../models/doctor_profile_model.dart';
import '../models/get_labs_model.dart';
import '../models/heart_model.dart';
import '../models/profile_model.dart';

abstract class HomeBaseDataSource {

  Future <List<ProfileModel>> profile ({
    required int id,
});


  Future <List<ProfileModel>> doctor({
    required bool isDoctor,
  });

  Future <List<DoctorProfileModel>> doctorProfile({
    required int id,
  });

  Future <void> bookAppointment({
    required int id,
    required String date,
    required String time,
  });

  Future <List<GetAppointmentModel>> getAppointment();

  Future <List<GetLabsModel>> getLabs();


  Future <BloodCheckModel> bloodCheck({
    required int age,
    required int bmi,
    required int glucouse,
    required int insuline,
    required int homa,
    required int leptin,
    required int adiponcetin,
    required int resistiin,
    required int mcp,
  });

  Future <HeartCheckModel> heartCheck({
    required int age,
    required int sex,
    required int chestPainType,
    required int cholesterol,
    required int fastingBS,
    required int exerciseAngina,
    required int maxHR,
    required int oldpeak,
    required int sT_Slope,
  });



  Future <AlzahimarCheckModel> alzahimarCheck({
    required int age,
    required int gender,
    required int eDUC,
    required int sES,
    required int eTIV,
    required int mMSE,
    required int nWBV,
    required int aSF,
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


  @override
  Future<List<ProfileModel>> doctor({
    required bool isDoctor,
  }) async
  {
    final Response f = await dioHelper.get(
        url: '$registerEndPoint?is_doctor=true'
    );
    return List<ProfileModel>.from(
        (f.data['results'] as List).map((e) => ProfileModel.fromJson(e)));
    //ProfileModel.fromJson(f.data);
  }


  @override
  Future<List<GetAppointmentModel>> getAppointment() async
  {
    final Response f = await dioHelper.get(
        token: token,
        url: appointment
    );
    return List<GetAppointmentModel>.from(
        (f.data['results'] as List).map((e) => GetAppointmentModel.fromJson(e)));
    //ProfileModel.fromJson(f.data);
  }


  @override
  Future<List<DoctorProfileModel>> doctorProfile({
    required int id,
  }) async
  {
    final Response f = await dioHelper.get(
        url: '$registerEndPoint$id/doctorProfile/'
    );
    return List<DoctorProfileModel>.from(
        (f.data['dates'] as List).map((e) => DoctorProfileModel.fromJson(e)));
    // return List<DoctorProfileModel>.from(
    //     (f.data['dates'] as List).map((e) => DoctorProfileModel.fromJson(e))).where((element) => element.date.split('-')[0] ==DateTime.now().year).toList();

    //ProfileModel.fromJson(f.data);
  }


  @override
  Future<void> bookAppointment({
    required int id,
    required String date,
    required String time,
  }) async
  {
     await dioHelper.post(
        url: appointment,
        token: token,
        data:
        {
          'doctor': id,
          'date': date,
          'time': time,
        }
    );

  }



  @override
  Future<List<GetLabsModel>> getLabs() async
  {
    final Response f = await dioHelper.get(
      url: labs,
      token: token,
    );
    return List<GetLabsModel>.from(
        (f.data['results'] as List).map((e) => GetLabsModel.fromJson(e)));
  }


  @override
  Future<BloodCheckModel> bloodCheck({
    required int age,
    required int bmi,
    required int glucouse,
    required int insuline,
    required int homa,
    required int leptin,
    required int adiponcetin,
    required int resistiin,
    required int mcp,
}) async
  {
    final Response f = await dioHelper.post(
      url: bloodCheckURL,
      token: token,
      data:
      {
        'age':age,
        'bmi':bmi,
        'glucouse':glucouse,
        'insuline':insuline,
        'homa':homa,
        'leptin':leptin,
        'adiponcetin':adiponcetin,
        'resistiin':resistiin,
        'mcp':mcp,
      }
    );
    return BloodCheckModel.fromJson(f.data);
  }


  @override
  Future<HeartCheckModel> heartCheck({
    required int age,
    required int sex,
    required int chestPainType,
    required int cholesterol,
    required int fastingBS,
    required int exerciseAngina,
    required int maxHR,
    required int oldpeak,
    required int sT_Slope,
  }) async
  {
    final Response f = await dioHelper.post(
        url: heartTestUrl,
        token: token,
        data:
        {
          'Age':age,
          'Sex':sex,
          'ChestPainType':chestPainType,
          'Cholesterol':cholesterol,
          'FastingBS':fastingBS,
          'MaxHR':maxHR,
          'ExerciseAngina':exerciseAngina,
          'Oldpeak':oldpeak,
          'ST_Slope':sT_Slope,
        }
    );
    return HeartCheckModel.fromJson(f.data);
  }


  @override
  Future<AlzahimarCheckModel> alzahimarCheck({
    required int age,
    required int gender,
    required int eDUC,
    required int sES,
    required int eTIV,
    required int mMSE,
    required int nWBV,
    required int aSF,
  }) async
  {
    final Response f = await dioHelper.post(
        url: alzahimerTestURl,
        token: token,
        data:
        {
          'Age':age,
          'gender':gender,
          'EDUC':eDUC,
          'SES':sES,
          'MMSE':mMSE,
          'eTIV':eTIV,
          'nWBV':nWBV,
          'ASF':aSF,
        }
    );
    return AlzahimarCheckModel.fromJson(f.data);
  }


}
