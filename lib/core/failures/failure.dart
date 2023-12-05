import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final String stackTrace;
  const Failure({
    required this.message,
    required this.stackTrace,
  });

  @override
  List<Object> get props => [message,stackTrace];
}