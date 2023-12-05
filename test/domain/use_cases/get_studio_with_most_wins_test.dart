import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/entities/studio.dart';
import 'package:movie_texo/domain/repositories/movie_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_texo/domain/use_cases/get_studio_with_most_wins.dart';

import 'get_movies_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository mockMovieRepository;
  late GetStudiosWithMostWins useCase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetStudiosWithMostWins(repository: mockMovieRepository);
  });

  const tStudios = [Studio(name: 'Studio A', winCount: 3), Studio(name: 'Studio B', winCount: 2)];

  test('should get the list of studios with most wins from the repository', () async {
    // Arrange
    when(mockMovieRepository.getStudiosWithMostWins(any))
        .thenAnswer((_) async => const Right(tStudios));

    // Act
    final result = await useCase(NoParams());

    // Assert
    expect(result, const Right(tStudios));
    verify(mockMovieRepository.getStudiosWithMostWins(NoParams()));
    verifyNoMoreInteractions(mockMovieRepository);
  });

  test('should return a failure when the repository fails', () async {
    // Arrange
    when(mockMovieRepository.getStudiosWithMostWins(any))
        .thenAnswer((_) async => const Left(Failure(message: "test failure", stackTrace: '')));

    // Act
    final result = await useCase(NoParams());

    // Assert
    expect(result, const Left(Failure(message: "test failure", stackTrace: '')));
    verify(mockMovieRepository.getStudiosWithMostWins(NoParams()));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
