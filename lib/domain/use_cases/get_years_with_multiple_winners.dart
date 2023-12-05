import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/core/use_cases/usecases.dart';
import 'package:movie_texo/domain/entities/year_with_multiple_winners.dart';
import 'package:movie_texo/domain/repositories/movie_repository.dart';

/// `GetYearsWithMultipleWinners` is a use case for retrieving a list of years
/// during which there were multiple winners at the Golden Raspberry Awards.
///
/// This use case focuses on identifying the years where more than one film or individual
/// received an award, indicating a tie or multiple categories with winners.
class GetYearsWithMultipleWinners extends UseCase<List<YearWithMultipleWinners>, NoParams> {

  /// Repository used for fetching data about years with multiple winners.
  ///
  /// The [MovieRepository] is an abstraction representing the data source
  /// (such as an API or a local database) responsible for retrieving information
  /// about the specific years with multiple award winners.
  final MovieRepository repository;

  /// Constructor for `GetYearsWithMultipleWinners` use case.
  ///
  /// Requires a [repository] of type [MovieRepository] for its operation,
  /// which will be utilized to access the relevant data about the years.
  GetYearsWithMultipleWinners({required this.repository});

  /// Executes the use case to fetch a list of years with multiple winners.
  ///
  /// This method uses the [repository] to retrieve information about the years
  /// that had multiple winners at the Golden Raspberry Awards.
  /// No input parameters are required for this operation.
  /// Returns an [Either] containing a [Failure] in case of an error, or a list of [YearWithMultipleWinners]
  /// entities in case of success.
  @override
  Future<Either<Failure, List<YearWithMultipleWinners>>> call(NoParams params) {
    return repository.getYearsWithMultipleWinners(params);
  }
}
