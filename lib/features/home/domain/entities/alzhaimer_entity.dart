import 'package:equatable/equatable.dart';

class AlzahimarCheckEntity extends Equatable
{
  String result;

  AlzahimarCheckEntity({
    required this.result,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    result,
  ];
}