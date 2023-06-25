import 'package:equatable/equatable.dart';

class GetLabsEntity extends Equatable
{
  int id;
  String labCountry;
  String labEmail;
  String labName;
  String labAddress;
  String labStartTime;
  String labEndTime;
  String labPhone;

  GetLabsEntity({
    required this.id,
    required this.labAddress,
    required this.labCountry,
    required this.labEmail,
    required this.labEndTime,
    required this.labName,
    required this.labPhone,
    required this.labStartTime,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    labAddress,
    labCountry,
    labEmail,
    labEndTime,
    labName,
    labPhone,
    labStartTime,
  ];
}