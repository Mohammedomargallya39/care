import 'package:equatable/equatable.dart';

class GetAppointmentEntity extends Equatable {

  final int id;
  final String date;
  final String time;
  final String createdAt;
  final PatientData patientData;
  final DoctorData doctorData;
  GetAppointmentEntity({
    required this.id,
    required this.time,
    required this.date,
    required this.createdAt,
    required this.doctorData,
    required this.patientData,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    time,
    date,
    createdAt,
    doctorData,
    patientData,
  ];
}

class DoctorData extends Equatable
{
  final int doctorId;
  final String doctorUserName;
  final String doctorEmail;
  final String doctorPic;

  DoctorData({
    required this.doctorId,
    required this.doctorEmail,
    required this.doctorUserName,
    required this.doctorPic,
  });

  factory DoctorData.fromJson(Map<String,dynamic> json)
  {
    return DoctorData(
        doctorId: json['id'],
        doctorEmail: json['email'],
        doctorUserName: json['username'],
        doctorPic: json['profile_pic'],
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    doctorId,
    doctorEmail,
    doctorUserName,
    doctorPic,
  ];

}

class PatientData extends Equatable
{
  final int patientId;
  final String patientUserName;
  final String patientEmail;
  final String patientPic;

  PatientData({
    required this.patientId,
    required this.patientEmail,
    required this.patientUserName,
    required this.patientPic,
  });

  factory PatientData.fromJson(Map<String,dynamic> json)
  {
    return PatientData(
      patientId: json['id'],
      patientEmail: json['email'],
      patientUserName: json['username'],
      patientPic: json['profile_pic'],
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    patientId,
    patientEmail,
    patientUserName,
    patientPic,
  ];

}