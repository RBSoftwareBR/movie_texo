import 'package:movie_texo/core/failures/data_source_failure.dart';

class ApiFailure extends DataSourceFailure {
  final String code;
  const ApiFailure({
    required this.code,
    required super.message,
    required super.stackTrace,
  });

  @override
  List<Object> get props => [message,stackTrace,code];
}