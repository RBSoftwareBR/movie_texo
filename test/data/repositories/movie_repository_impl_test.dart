import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/failures/data_source_failure.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/data/data_source/movie_data_source.dart';
import 'package:movie_texo/data/dto/movie_result_dto.dart';
import 'package:movie_texo/data/dto/producer_interval_dto.dart';
import 'package:movie_texo/data/dto/producer_interval_result_dto.dart';
import 'package:movie_texo/data/dto/studio_dto.dart';
import 'package:movie_texo/data/dto/year_with_multiple_winners_dto.dart';
import 'package:movie_texo/domain/entities/movie.dart';
import 'package:movie_texo/domain/entities/pageable.dart';
import 'package:movie_texo/domain/entities/sort.dart';
import 'package:movie_texo/data/repositories/movie_repository_impl.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateMocks([MovieDataSource])
void main() {
  late MockMovieDataSource mockMovieDataSource;
  late MovieRepositoryImpl repository;
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

  const movieResult = MovieResultDto(
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
  final tYears = [const YearWithMultipleWinnersDto(year: 1980, winnerCount: 2)];


  setUp(() {
    mockMovieDataSource = MockMovieDataSource();
    repository = MovieRepositoryImpl(dataSource: mockMovieDataSource);
  });

  group('getMovies', () {
    const tParams = GetMoviesParams(
        page: 1, size: 10, year: 2021, winner: true);

    test('should call getMovies on the data source', () async {
      // Arrange
      when(mockMovieDataSource.getMovies(tParams))
          .thenAnswer((_) async => const Right(movieResult));

      // Act
      repository.getMovies(tParams);

      // Assert
      verify(mockMovieDataSource.getMovies(tParams)).called(1);
    });

    test(
        'should return data when the call to data source is successful', () async {
      // Arrange
      when(mockMovieDataSource.getMovies(tParams))
          .thenAnswer((_) async => const Right(movieResult));

      // Act
      final result = await repository.getMovies(tParams);

      // Assert
      expect(result, const Right(movieResult));
    });

    test(
        'should return a failure when the call to data source is unsuccessful', () async {
      // Arrange
      when(mockMovieDataSource.getMovies(tParams))
          .thenAnswer((_) async =>
      const Left(DataSourceFailure(message: 'Error', stackTrace: '')));

      // Act
      final result = await repository.getMovies(tParams);

      // Assert
      expect(result,
          const Left(DataSourceFailure(message: 'Error', stackTrace: '')));
    });
  });

  group('getMovies', ()
  {
    test(
        'should return years with multiple winners when the call to dataSource is successful', () async {
      // Arrange
      when(mockMovieDataSource.getYearsWithMultipleWinners(NoParams()))
          .thenAnswer((_) async => Right(tYears));

      // Act
      final result = await repository.getYearsWithMultipleWinners(NoParams());

      // Assert
      expect(result, Right(tYears));
      verify(mockMovieDataSource.getYearsWithMultipleWinners(NoParams()))
          .called(1);
    });

    test(
        'should return a Failure when the call to dataSource is unsuccessful', () async {
      // Arrange
      when(mockMovieDataSource.getYearsWithMultipleWinners(NoParams()))
          .thenAnswer((_) async =>
      const Left(DataSourceFailure(message: 'Some error', stackTrace: '')));

      // Act
      final result = await repository.getYearsWithMultipleWinners(NoParams());

      // Assert
      expect(result, const Left(DataSourceFailure(message: 'Some error', stackTrace: '')));
      verify(mockMovieDataSource.getYearsWithMultipleWinners(NoParams()))
          .called(1);
    });
  });
  group("getProducersWithMaxMinInterval",(){
    const ProducerIntervalDto minProducer = ProducerIntervalDto(
        producer: 'Produtor Min',
        interval: 1,
        previousWin: 2010,
        followingWin: 2011);
    const ProducerIntervalDto maxProducer = ProducerIntervalDto(
        producer: 'Produtor Max',
        interval: 10,
        previousWin: 2000,
        followingWin: 2010);
    const ProducerIntervalResultDto tProducerIntervalResult =
    ProducerIntervalResultDto(min: [minProducer], max: [maxProducer]);

    test('should return producer interval result when the call to dataSource is successful', () async {
      // Arrange
      when(mockMovieDataSource.getProducersWithMaxMinInterval(NoParams()))
          .thenAnswer((_) async => const Right(tProducerIntervalResult));

      // Act
      final result = await repository.getProducersWithMaxMinInterval(NoParams());

      // Assert
      expect(result, const Right(tProducerIntervalResult));
      verify(mockMovieDataSource.getProducersWithMaxMinInterval(NoParams())).called(1);
    });

    test('should return a Failure when the call to dataSource is unsuccessful', () async {
      // Arrange
      when(mockMovieDataSource.getProducersWithMaxMinInterval(NoParams()))
          .thenAnswer((_) async => const Left(DataSourceFailure(message: 'Some error', stackTrace: '')));

      // Act
      final result = await repository.getProducersWithMaxMinInterval(NoParams());

      // Assert
      expect(result, const Left(DataSourceFailure(message: 'Some error', stackTrace: '')));
      verify(mockMovieDataSource.getProducersWithMaxMinInterval(NoParams())).called(1);
    });
  });

  group("",(){
    final tStudios = [
      const StudioDto(name: 'Studio 1', winCount: 5),
      const StudioDto(name: 'Studio 2', winCount: 3),
      // Adicione mais estúdios conforme necessário
    ];

    test('should return a list of studios when the call to dataSource is successful', () async {
      // Arrange
      when(mockMovieDataSource.getStudiosWithMostWins(NoParams()))
          .thenAnswer((_) async => Right(tStudios));

      // Act
      final result = await repository.getStudiosWithMostWins(NoParams());

      // Assert
      expect(result, Right(tStudios));
      verify(mockMovieDataSource.getStudiosWithMostWins(NoParams())).called(1);
    });

    test('should return a Failure when the call to dataSource is unsuccessful', () async {
      // Arrange
      when(mockMovieDataSource.getStudiosWithMostWins(NoParams()))
          .thenAnswer((_) async => const Left(DataSourceFailure(message: 'Some error', stackTrace: '')));

      // Act
      final result = await repository.getStudiosWithMostWins(NoParams());

      // Assert
      expect(result,const Left(DataSourceFailure(message: 'Some error', stackTrace: '')));
      verify(mockMovieDataSource.getStudiosWithMostWins(NoParams())).called(1);
    });
  });
}

