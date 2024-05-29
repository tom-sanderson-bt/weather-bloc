import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({
    required this.message,
    this.statusCode,
  });

  @override
  List<Object> get props => [message];
}

class ApiFailure extends Failure {
  const ApiFailure({required super.message, super.statusCode});
}
