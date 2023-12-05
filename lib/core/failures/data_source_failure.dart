import 'package:movie_texo/core/failures/failure.dart';

class DataSourceFailure extends Failure {
  const DataSourceFailure({
    required super.message,
    required super.stackTrace,
  });

  @override
  List<Object> get props => [message,stackTrace];
}