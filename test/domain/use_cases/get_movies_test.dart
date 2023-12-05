import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/domain/entities/movie.dart';
import 'package:movie_texo/domain/entities/movie_result.dart';
import 'package:movie_texo/domain/entities/pageable.dart';
import 'package:movie_texo/domain/entities/sort.dart';
import 'package:movie_texo/domain/repositories/movie_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_texo/domain/use_cases/get_movies.dart';
import 'get_movies_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository mockMovieRepository;
  late GetMovies useCase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetMovies(repository: mockMovieRepository);
  });

  const movies = [
    Movie(
        id: 1,
        year: 1980,
        title: 'Movie 1',
        studios: ['Studio 1'],
        producers: ['Producer 1'],
        winner: false),
    Movie(
        id: 2,
        year: 1981,
        title: 'Movie 2',
        studios: ['Studio 2'],
        producers: ['Producer 2'],
        winner: true),
  ];
  const sort = Sort(unsorted: false, sorted: true, empty: false);
  const pageable = Pageable(
      offset: 0,
      pageSize: 10,
      pageNumber: 1,
      paged: true,
      unpaged: false,
      sort: sort);

  const movieResult = MovieResult(
    movies: movies,
    pageable: pageable,
    last: false,
    totalPages: 10,
    totalElements: 100,
    size: 10,
    number: 1,
    sort: sort,
    first: true,
    numberOfElements: 2,
    empty: false,
  );
  const tParams = GetMoviesParams(page: 1,size: 2,winner: true,year: 2021);

  test('should get list of movies from the repository', () async {
    // Arrange
    when(mockMovieRepository.getMovies(any)).thenAnswer((_) async => const Right(movieResult));

    // Act
    final result = await useCase(tParams);

    // Assert
    expect(result, const Right(movieResult));
    verify(mockMovieRepository.getMovies(tParams));
    verifyNoMoreInteractions(mockMovieRepository);
  });

  test('should return failure when there is an error', () async {
    // Arrange
    when(mockMovieRepository.getMovies(any)).thenAnswer((_) async => const Left(Failure(message: "test error",stackTrace: "")));

    // Act
    final result = await useCase(tParams);

    // Assert
    expect(result, const Left(Failure(message: "test error",stackTrace: "")));
    verify(mockMovieRepository.getMovies(tParams));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
