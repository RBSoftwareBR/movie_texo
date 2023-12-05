import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/entities/movie_result.dart';
import 'package:movie_texo/domain/entities/producer_interval_result.dart';
import 'package:movie_texo/domain/entities/studio.dart';
import 'package:movie_texo/domain/entities/year_with_multiple_winners.dart';

abstract class MovieRepository{
  /// Define how to get movie information.
  /// Send [GetMoviesParams] and return [List<Movie>] when successful.
  /// Otherwise returns [Failure].
  Future<Either<Failure,MovieResult>> getMovies(GetMoviesParams params);

  /// Define how to get years with multiple winners.
  /// Send [NoParams] and return [List<YearWithMultipleWinners>] when successful.
  /// Otherwise returns [Failure].
  Future<Either<Failure,List<YearWithMultipleWinners>>> getYearsWithMultipleWinners(NoParams params);

  /// Define how to get years with multiple winners.
  /// Send [NoParams] and return [List<YearWithMultipleWinners>] when successful.
  /// Otherwise returns [Failure].
  Future<Either<Failure,ProducerIntervalResult>> getProducersWithMaxMinInterval(NoParams params);

  /// Define how to get studio with most wins.
  /// Send [NoParams] and return [List<Studio>] when successful.
  /// Otherwise returns [Failure].
  Future<Either<Failure, List<Studio>>> getStudiosWithMostWins(NoParams params);
}
