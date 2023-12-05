import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/data/data_source/movie_data_source.dart';
import 'package:movie_texo/domain/entities/movie_result.dart';
import 'package:movie_texo/domain/entities/producer_interval_result.dart';
import 'package:movie_texo/domain/entities/studio.dart';
import 'package:movie_texo/domain/entities/year_with_multiple_winners.dart';
import 'package:movie_texo/domain/repositories/movie_repository.dart';

/// Implementation of [MovieRepository] that communicates with a data source to retrieve movie data.
///
/// This class implements the methods defined in the [MovieRepository] abstract class, providing
/// concrete functionality for fetching data about movies, studios, producers, and specific years
/// from the Golden Raspberry Awards. It acts as a bridge between the domain layer and data layer,
/// abstracting the details of data retrieval from the use cases.
class MovieRepositoryImpl extends MovieRepository {
  /// The data source from which movie-related data is retrieved.
  final MovieDataSource dataSource;

  /// Constructor for [MovieRepositoryImpl].
  ///
  /// Requires a [dataSource] of type [MovieDataSource] which is the actual provider of the data,
  /// typically involving API calls or database queries.
  MovieRepositoryImpl({required this.dataSource});

  /// Define how to get movie information.
  /// Send [GetMoviesParams] and return [List<Movie>] when successful.
  /// Otherwise returns [Failure].
  @override
  Future<Either<Failure,MovieResult>> getMovies(GetMoviesParams params){
    return dataSource.getMovies(params);
  }

  /// Define how to get years with multiple winners.
  /// Send [NoParams] and return [List<YearWithMultipleWinners>] when successful.
  /// Otherwise returns [Failure].
  @override
  Future<Either<Failure,List<YearWithMultipleWinners>>> getYearsWithMultipleWinners(NoParams params){
    return dataSource.getYearsWithMultipleWinners(params);
  }

  /// Define how to get years with multiple winners.
  /// Send [NoParams] and return [List<YearWithMultipleWinners>] when successful.
  /// Otherwise returns [Failure].
  @override
  Future<Either<Failure,ProducerIntervalResult>> getProducersWithMaxMinInterval(NoParams params){
    return dataSource.getProducersWithMaxMinInterval(params);
  }

  /// Define how to get studio with most wins.
  /// Send [NoParams] and return [List<Studio>] when successful.
  /// Otherwise returns [Failure].
  @override
  Future<Either<Failure, List<Studio>>> getStudiosWithMostWins(NoParams params){
    return dataSource.getStudiosWithMostWins(params);
  }
}
