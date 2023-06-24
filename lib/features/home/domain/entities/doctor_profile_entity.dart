import 'package:equatable/equatable.dart';

class DoctorProfileEntity extends Equatable
{
  int appointmentId;
  int doctorId;
  String doctorUserName;
  String date;
  String timeStart;
  String timeEnd;
  String createdAt;
  bool availability;

  DoctorProfileEntity({
    required this.appointmentId,
    required this.doctorId,
    required this.doctorUserName,
    required this.date,
    required this.timeStart,
    required this.timeEnd,
    required this.createdAt,
    required this.availability,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    appointmentId,
    doctorId,
    doctorUserName,
    date,
    timeStart,
    timeEnd,
    createdAt,
    availability,
  ];
}