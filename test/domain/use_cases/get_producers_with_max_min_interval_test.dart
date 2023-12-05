import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/entities/producer_interval.dart';
import 'package:movie_texo/domain/entities/producer_interval_result.dart';
import 'package:movie_texo/domain/repositories/movie_repository.dart';
import 'package:movie_texo/domain/use_cases/get_producers_with_max_min_interval.dart';
import 'package:mockito/annotations.dart';
import 'get_movies_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository mockMovieRepository;
  late GetProducersWithMaxMinInterval useCase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetProducersWithMaxMinInterval(repository: mockMovieRepository);
  });

  const tProducerIntervalResult = ProducerIntervalResult(
    min: [ProducerInterval(producer: 'Producer Min', interval: 1, previousWin: 2010, followingWin: 2011)],
    max: [ProducerInterval(producer: 'Producer Max', interval: 10, previousWin: 2000, followingWin: 2010)],
  );

  test('should get the producer interval result from the repository', () async {
    // Arrange
    when(mockMovieRepository.getProducersWithMaxMinInterval(any))
        .thenAnswer((_) async => const Right(tProducerIntervalResult));

    // Act
    final result = await useCase(NoParams());

    // Assert
    expect(result, const Right(tProducerIntervalResult));
    verify(mockMovieRepository.getProducersWithMaxMinInterval(NoParams()));
    verifyNoMoreInteractions(mockMovieRepository);
  });

  test('should return a failure when the repository fails', () async {
    // Arrange
    when(mockMovieRepository.getProducersWithMaxMinInterval(any))
        .thenAnswer((_) async => const Left(Failure(message: "test failure", stackTrace: '')));

    // Act
    final result = await useCase(NoParams());

    // Assert
    expect(result, const Left(Failure(message: "test failure", stackTrace: '')));
    verify(mockMovieRepository.getProducersWithMaxMinInterval(NoParams()));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
