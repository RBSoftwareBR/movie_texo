import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure,Type>> call(Params params);
}