import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/api_failure.dart';

abstract class ApiUtil {
  Future<Either<ApiFailure, String>> get({required String endPoint});
}
