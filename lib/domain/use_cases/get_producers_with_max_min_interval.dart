import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/core/use_cases/usecases.dart';
import 'package:movie_texo/domain/entities/producer_interval_result.dart';
import 'package:movie_texo/domain/repositories/movie_repository.dart';

/// `GetProducersWithMaxMinInterval` is a use case for fetching the maximum and minimum
/// winning intervals for producers from the Golden Raspberry Awards.
///
/// This use case fetches data regarding producers who have won awards at different intervals,
/// identifying those with the shortest and longest periods between wins.
class GetProducersWithMaxMinInterval extends UseCase<ProducerIntervalResult, NoParams> {

  /// Repository used for fetching producer data.
  ///
  /// The [MovieRepository] is an abstraction representing the data source (API, local database, etc.)
  /// and is responsible for retrieving producer interval information.
  final MovieRepository repository;

  /// Constructor for the `GetProducersWithMaxMinInterval` use case.
  ///
  /// It requires a [repository] of type [MovieRepository] to function,
  /// which will be utilized to access the necessary data.
  GetProducersWithMaxMinInterval({required this.repository});

  /// Executes the use case to fetch the producer interval data.
  ///
  /// This method uses the [repository] to retrieve data about producers with the maximum and minimum
  /// intervals between their award wins. It does not require any parameters.
  /// Returns an [Either] containing a [Failure] in case of an error, or a [ProducerIntervalResult]
  /// in case of success.
  @override
  Future<Either<Failure, ProducerIntervalResult>> call(NoParams params) {
    return repository.getProducersWithMaxMinInterval(params);
  }
}
