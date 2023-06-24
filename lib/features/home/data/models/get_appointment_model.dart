import 'package:care/features/home/domain/entities/get_appointment_entity.dart';

class GetAppointmentModel extends GetAppointmentEntity
{
  GetAppointmentModel({
    required super.id,
    required super.date,
    required super.time,
    required super.createdAt,
    required super.patientData,
    required super.doctorData,
});
  factory GetAppointmentModel.fromJson(Map<String,dynamic>json){
    return GetAppointmentModel(
      id: json['id'],
      date: json['date'],
      createdAt: json['created_at'],
      time: json['time'],
      doctorData: DoctorData.fromJson(json['doctor_data']),
      patientData: PatientData.fromJson(json['patient_data']),
    );
  }
}