import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/core/use_cases/usecases.dart';
import 'package:movie_texo/domain/entities/movie.dart';
import 'package:movie_texo/domain/entities/movie_result.dart';
import 'package:movie_texo/domain/repositories/movie_repository.dart';

/// `GetMovieList` is a use case for fetching a list of movies.
///
/// This use case utilizes a [MovieRepository] to perform the operation of retrieving
/// movie data. It returns a list of movies based on provided parameters.
class GetMovies extends UseCase<MovieResult, GetMoviesParams> {
  /// Repository used to fetch movie data.
  ///
  /// The [MovieRepository] is an abstraction of the data source (such as an API or a local database)
  /// that is responsible for retrieving movie information.
  MovieRepository repository;

  /// Constructor for the `GetMovieList` use case.
  ///
  /// Requires a [repository] of type [MovieRepository] to function.
  /// This repository is then used to fetch the movie list.
  GetMovies({required this.repository});

  /// Fetches a list of movies.
  ///
  /// Uses the [repository] to retrieve the movie list based on the provided [params].
  /// Returns an [Either] containing a [Failure] in case of an error or a list of [Movie] in case of success.
  @override
  Future<Either<Failure, MovieResult>> call(params) {
    return repository.getMovies(params);
  }
}
