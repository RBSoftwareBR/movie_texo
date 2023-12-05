import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:movie_texo/core/api/api_util.dart';
import 'package:movie_texo/core/failures/api_failure.dart';

class ApiUtilImpl extends ApiUtil {
  ApiUtilImpl();

  @override
  Future<Either<ApiFailure, String>> get({required String endPoint}) async {
    var result = await http.get(
        Uri.parse(endPoint));
    if (result.statusCode >= 200 && result.statusCode <= 300) {
      return Right(result.body);
    } else {
      return Left(ApiFailure(
          code: '${result.statusCode}',
          message: "url: ${result.request!.url} ",
          stackTrace: result.body));
    }
  }
}
