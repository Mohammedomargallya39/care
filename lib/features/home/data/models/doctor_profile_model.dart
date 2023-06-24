import '../../domain/entities/doctor_profile_entity.dart';

class DoctorProfileModel extends DoctorProfileEntity
{
  DoctorProfileModel(
      {
        required super.appointmentId,
        required super.doctorId,
        required super.doctorUserName,
        required super.date,
        required super.timeStart,
        required super.timeEnd,
        required super.createdAt,
        required super.availability,
      });

  factory DoctorProfileModel.fromJson(Map<String,dynamic> json)
  {
    return DoctorProfileModel(
        appointmentId: json['id'],
        doctorId: json['doctor'],
        doctorUserName: json['doctor_username'],
        date: json['date'],
        timeStart: json['time_from'],
        timeEnd: json['time_to'],
        createdAt: json['created_at'],
        availability: json['availability'],
    );
  }

}