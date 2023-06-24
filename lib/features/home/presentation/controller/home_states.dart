

import '../../domain/entities/doctor_profile_entity.dart';
import '../../domain/entities/get_appointment_entity.dart';
import '../../domain/entities/profile_entity.dart';

abstract class HomeStates{

}

class HomeInitialState extends HomeStates{

}class HomeChangeNavBottomScreensState extends HomeStates{

}

class SignOutState extends HomeStates{

}

class LoadingProfileState extends HomeStates{}

class ProfileErrorState extends HomeStates{
  final String failure;

  ProfileErrorState(this.failure);
}

class ProfileSuccessState extends HomeStates{
  List<ProfileEntity> profileEntity;
  ProfileSuccessState(this.profileEntity);
}


class LoadingDoctorState extends HomeStates{}

class DoctorErrorState extends HomeStates{
  final String failure;

  DoctorErrorState(this.failure);
}

class DoctorSuccessState extends HomeStates{
  List<ProfileEntity> doctorEntity;
  DoctorSuccessState(this.doctorEntity);
}

class LoadingDoctorProfileState extends HomeStates{}

class DoctorProfileErrorState extends HomeStates{
  final String failure;

  DoctorProfileErrorState(this.failure);
}

class DoctorProfileSuccessState extends HomeStates{
  List<DoctorProfileEntity> doctorProfileEntity;
  DoctorProfileSuccessState(this.doctorProfileEntity);
}


class ChangeTimeState extends HomeStates{}
class SelectedTimeState extends HomeStates{}


class LoadingBookAppointmentState extends HomeStates{}
class ErrorBookAppointmentState extends HomeStates{
  final String failure;
  ErrorBookAppointmentState(this.failure);
}
class SuccessBookAppointmentState extends HomeStates{}


class LoadingGetAppointmentState extends HomeStates{}

class GetAppointmentErrorState extends HomeStates{
  final String failure;

  GetAppointmentErrorState(this.failure);
}

class GetAppointmentSuccessState extends HomeStates{
  List<GetAppointmentEntity> getAppointmentEntity;
  GetAppointmentSuccessState(this.getAppointmentEntity);
}

