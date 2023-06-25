import 'package:equatable/equatable.dart';

class BloodCheckEntity extends Equatable
{
  String result;

  BloodCheckEntity({
    required this.result,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    result,
  ];
}