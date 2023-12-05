import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/entities/year_with_multiple_winners.dart';
import 'package:movie_texo/domain/repositories/movie_repository.dart';
import 'package:movie_texo/domain/use_cases/get_years_with_multiple_winners.dart';
import 'package:mockito/annotations.dart';

import 'get_movies_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository mockMovieRepository;
  late GetYearsWithMultipleWinners useCase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetYearsWithMultipleWinners(repository: mockMovieRepository);
  });

  const tYears = [YearWithMultipleWinners(year: 1999, winnerCount: 2), YearWithMultipleWinners(year: 2005, winnerCount: 3)];

  test('should get the list of years with multiple winners from the repository', () async {
    // Arrange
    when(mockMovieRepository.getYearsWithMultipleWinners(any))
        .thenAnswer((_) async => const Right(tYears));

    // Act
    final result = await useCase(NoParams());

    // Assert
    expect(result, const Right(tYears));
    verify(mockMovieRepository.getYearsWithMultipleWinners(NoParams()));
    verifyNoMoreInteractions(mockMovieRepository);
  });

  test('should return a failure when the repository fails', () async {
    // Arrange
    when(mockMovieRepository.getYearsWithMultipleWinners(any))
        .thenAnswer((_) async => const Left(Failure(message: "test failure", stackTrace: '')));

    // Act
    final result = await useCase(NoParams());

    // Assert
    expect(result, const Left(Failure(message: "test failure", stackTrace: '')));
    verify(mockMovieRepository.getYearsWithMultipleWinners(NoParams()));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
