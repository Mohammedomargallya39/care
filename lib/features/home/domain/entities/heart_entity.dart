import 'package:equatable/equatable.dart';

class HeartCheckEntity extends Equatable
{
  String result;

  HeartCheckEntity({
    required this.result,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    result,
  ];
}