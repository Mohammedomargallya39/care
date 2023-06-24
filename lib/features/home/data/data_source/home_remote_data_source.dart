import 'package:care/core/network/remote/api_endpoints.dart';
import 'package:care/core/util/resources/constants_manager.dart';
import 'package:care/features/home/data/models/get_appointment_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/remote/dio_helper.dart';
import '../models/doctor_profile_model.dart';
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

}
