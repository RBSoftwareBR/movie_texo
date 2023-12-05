import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/data_source_failure.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/data/dto/movie_result_dto.dart';
import 'package:movie_texo/data/dto/producer_interval_result_dto.dart';
import 'package:movie_texo/data/dto/studio_dto.dart';
import 'package:movie_texo/data/dto/year_with_multiple_winners_dto.dart';

abstract class MovieDataSource{
  /// Define how to get movie information.
  /// Send [GetMoviesParams] and return [List<MovieDto>] when successful.
  /// Otherwise returns [DataSourceFailure].
  Future<Either<DataSourceFailure,MovieResultDto>> getMovies(GetMoviesParams params);

  /// Define how to get years with multiple winners.
  /// Send [NoParams] and return [List<YearWithMultipleWinnersDto>] when successful.
  /// Otherwise returns [DataSourceFailure].
  Future<Either<DataSourceFailure,List<YearWithMultipleWinnersDto>>> getYearsWithMultipleWinners(NoParams params);

  /// Define how to get years with multiple winners.
  /// Send [NoParams] and return [List<ProducerIntervalResultDto>] when successful.
  /// Otherwise returns [DataSourceFailure].
  Future<Either<DataSourceFailure,ProducerIntervalResultDto>> getProducersWithMaxMinInterval(NoParams params);

  /// Define how to get studio with most wins.
  /// Send [NoParams] and return [List<StudioDto>] when successful.
  /// Otherwise returns [DataSourceFailure].
  Future<Either<DataSourceFailure, List<StudioDto>>> getStudiosWithMostWins(NoParams params);
}
