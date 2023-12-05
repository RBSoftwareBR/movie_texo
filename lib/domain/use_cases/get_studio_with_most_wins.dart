import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/core/use_cases/usecases.dart';
import 'package:movie_texo/domain/entities/studio.dart';
import 'package:movie_texo/domain/repositories/movie_repository.dart';

/// `GetStudiosWithMostWins` is a use case for retrieving a list of film studios
/// with the most wins at the Golden Raspberry Awards.
///
/// This use case is responsible for fetching and providing information about
/// the film studios that have achieved the highest number of award wins, highlighting
/// their success in the industry.
class GetStudiosWithMostWins extends UseCase<List<Studio>, NoParams> {

  /// Repository used for fetching data about studios.
  ///
  /// The [MovieRepository] is an abstraction that represents the data source
  /// (such as an API or a local database) and is responsible for retrieving
  /// information about film studios and their award wins.
  final MovieRepository repository;

  /// Constructor for `GetStudiosWithMostWins` use case.
  ///
  /// Requires a [repository] of type [MovieRepository] to function,
  /// which is used for accessing the necessary studio data.
  GetStudiosWithMostWins({required this.repository});

  /// Executes the use case to fetch the list of studios with the most wins.
  ///
  /// This method utilizes the [repository] to retrieve data about film studios
  /// with the highest number of wins at the Golden Raspberry Awards.
  /// It does not require any input parameters.
  /// Returns an [Either] containing a [Failure] in case of an error, or a list of [Studio]
  /// entities in case of success.
  @override
  Future<Either<Failure, List<Studio>>> call(NoParams params) {
    return repository.getStudiosWithMostWins(params);
  }
}
