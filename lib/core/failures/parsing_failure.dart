import 'package:movie_texo/core/failures/data_source_failure.dart';

class ParsingFailure extends DataSourceFailure {
  final dynamic objectToParse;
  const ParsingFailure({
    required super.message,
    required this.objectToParse,
    required super.stackTrace,
  });


  @override
  String toString() {
    return 'ParsingFailure{message: $message, objectToParse: $objectToParse /n stackTrace: $stackTrace}';
  }

  @override
  List<Object> get props => [message,stackTrace,objectToParse];
}