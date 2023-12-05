import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_texo/core/api/api_config.dart';
import 'package:movie_texo/core/api/api_util.dart';
import 'package:movie_texo/core/failures/data_source_failure.dart';
import 'package:movie_texo/core/failures/parsing_failure.dart';
import 'package:movie_texo/core/logger.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/data/data_source/api_movie_data_source.dart';
import 'package:movie_texo/domain/entities/movie.dart';

import '../../fixtures/movies_fixture.dart';
import '../../fixtures/producers_fixture.dart';
import '../../fixtures/studios_fixture.dart';
import '../../fixtures/years_fixture.dart';
import 'api_movie_data_source_test.mocks.dart';

@GenerateMocks([ApiUtil])
void main() {
  late MockApiUtil mockApiUtil;
  late Logger mockLogger;
  late ApiMovieDataSource dataSource;
  late ApiConfig apiConfig;

  setUp(() {
    mockApiUtil = MockApiUtil();
    mockLogger = DebugLogger();
    apiConfig = ApiConfig(baseUrl: 'https://localhost/testapi');
    dataSource = ApiMovieDataSource(
        apiConfig: apiConfig, apiUtil: mockApiUtil, logger: mockLogger);
  });

  group('getMovies', () {
    const tMoviesParams =
        GetMoviesParams(page: 1, size: 2, winner: true, year: 2021);

    final List<Movie> tMoviesList = [
      const Movie(
          id: 197,
          year: 2018,
          title: "Holmes & Watson",
          studios: ["Columbia Pictures"],
          producers: [
            "Adam McKay",
            "Clayton Townsend",
            "Jimmy Miller",
            "Will Ferrell"
          ],
          winner: true)
    ];

    test('should return a list of movies when the call to API is successful',
        () async {
      // Arrange
      when(mockApiUtil.get(endPoint: apiConfig.getMovies(tMoviesParams)))
          .thenAnswer((_) async => const Right(tMoviesJson));

      // Act
      final List<Movie>? result = (await dataSource.getMovies(tMoviesParams))
          .fold((l) => null, (r) => r.movies);

      bool areMovieDtosEqual(Movie dto1, Movie dto2) {
        return dto1.id == dto2.id &&
            dto1.year == dto2.year &&
            // ... compare all fields ...
            listEquals(dto1.producers, dto2.producers) &&
            dto1.winner == dto2.winner;
      }

      // assert
      expect(areMovieDtosEqual(result![0], tMoviesList[0]), isTrue);
      expect(result.length, tMoviesList.length);
      expect(result.length == 1, isTrue);
      verify(mockApiUtil.get(endPoint: apiConfig.getMovies(tMoviesParams)))
          .called(1);
    });
    test('should return a empty list when the call to API is successful',
        () async {
      // Arrange
      when(mockApiUtil.get(endPoint: apiConfig.getMovies(tMoviesParams)))
          .thenAnswer((_) async => const Right(emptyMovieJson));

      // Act
      final List<Movie>? result = (await dataSource.getMovies(tMoviesParams))
          .fold((l) => null, (r) => r.movies);

      // assert
      expect(result!.isEmpty, isTrue);
      verify(mockApiUtil.get(endPoint: apiConfig.getMovies(tMoviesParams)))
          .called(1);
    });
    test('should return a empty list when the call to API is successful',
        () async {
      // Arrange
      when(mockApiUtil.get(endPoint: apiConfig.getMovies(tMoviesParams)))
          .thenAnswer((_) async => const Right(emptyMovieJson));

      // Act
      final List<Movie>? result = (await dataSource.getMovies(tMoviesParams))
          .fold((l) => null, (r) => r.movies);

      // assert
      expect(result!.isEmpty, isTrue);
      verify(mockApiUtil.get(endPoint: apiConfig.getMovies(tMoviesParams)))
          .called(1);
    });
    test(
        'should return a ParsingFailure call to API is successful but the content is invalid',
        () async {
      // Arrange
      const ParsingFailure expected = ParsingFailure(
          message: "type 'String' is not a subtype of type 'int' in type cast",
          objectToParse: "",
          stackTrace: "");
      when(mockApiUtil.get(endPoint: apiConfig.getMovies(tMoviesParams)))
          .thenAnswer((_) async => const Right(invalidMovieJson));

      // Act
      final DataSourceFailure? result =
          (await dataSource.getMovies(tMoviesParams))
              .fold((l) => l, (r) => null);

      // assert
      expect(result!.message, expected.message);
      verify(mockApiUtil.get(endPoint: apiConfig.getMovies(tMoviesParams)))
          .called(1);
    });
  });
  group('getYearsWithMultipleWinners', () {
    test('should return a list of years when the call to API is successful', () async {
      // Arrange
      when(mockApiUtil.get(endPoint: apiConfig.getYearsWithMultipleWinners(NoParams())))
          .thenAnswer((_) async =>const Right(tYearsWithMultipleWinnersJson));

      // Act
      final result = await dataSource.getYearsWithMultipleWinners(NoParams());

      // Assert
      result.fold(
            (failure) => fail('Expected success but got failure: $failure'),
            (years) {
          expect(years.length, 3); // Verify the number of items
          expect(years[0].year, 1986); // Verify properties of the first item
          expect(years[0].winnerCount, 2);
          // Additional assertions as needed
        },
      );
      verify(mockApiUtil.get(endPoint:apiConfig.getYearsWithMultipleWinners(NoParams()))).called(1);
    });

    test('should return an empty list when there are no years with multiple winners', () async {
      // Arrange
      when(mockApiUtil.get(endPoint: apiConfig.getYearsWithMultipleWinners(NoParams())))
          .thenAnswer((_) async => const Right(emptyYearsJson));

      // Act
      final result = await dataSource.getYearsWithMultipleWinners(NoParams());

      // Assert
      expect(result.getOrElse(() => []), isEmpty);
      verify(mockApiUtil.get(endPoint:apiConfig.getYearsWithMultipleWinners(NoParams()))).called(1);
    });

    test('should return a ParsingFailure when the content is invalid', () async {
      // Arrange
      const ParsingFailure expected = ParsingFailure(
          message: """FormatException: Unexpected character (at character 1)""",
          objectToParse: "",
          stackTrace: "");
      when(mockApiUtil.get(endPoint: apiConfig.getYearsWithMultipleWinners(NoParams())))
          .thenAnswer((_) async => const Right('Invalid JSON'));

      // Act
      final DataSourceFailure? result =
      (await dataSource.getYearsWithMultipleWinners(NoParams()))
          .fold((l) => l, (r) => null);

      // Assert
      expect(result!.message.contains(expected.message),isTrue );
      verify(mockApiUtil.get(endPoint: apiConfig.getYearsWithMultipleWinners(NoParams()))).called(1);
    });

  });
  group('getStudiosWithMostWins', () {
    test('should return a list of studios when the call to API is successful', () async {
      // Arrange
      when(mockApiUtil.get(endPoint: apiConfig.getStudiosWithMostWins(NoParams())))
          .thenAnswer((_) async => const Right(tStudiosJson));

      // Act
      final result = await dataSource.getStudiosWithMostWins(NoParams());

      // Assert
      result.fold(
            (failure) => fail('Expected success but got failure: $failure'),
            (studios) {
          expect(studios.length, 28); // Verify the number of items
          expect(studios[0].name, 'Columbia Pictures'); // Verify properties of the first studio
          expect(studios[0].winCount, 7);
          // Additional assertions as needed
        },
      );
      verify(mockApiUtil.get(endPoint:apiConfig.getStudiosWithMostWins(NoParams()))).called(1);
    });

    test('should return an empty list when there are no studios with most wins', () async {
      // Arrange
      when(mockApiUtil.get(endPoint: apiConfig.getStudiosWithMostWins(NoParams())))
          .thenAnswer((_) async => const Right(emptyStudiosJson));

      // Act
      final result = await dataSource.getStudiosWithMostWins(NoParams());

      // Assert
      expect(result.getOrElse(() => []), isEmpty);
      verify(mockApiUtil.get(endPoint:apiConfig.getStudiosWithMostWins(NoParams()))).called(1);
    });

    test('should return a ParsingFailure when the content is invalid', () async {
      // Arrange
      const ParsingFailure expected = ParsingFailure(
          message: "Unexpected character (at line 6, character 4",
          objectToParse: "",
          stackTrace: "");
      when(mockApiUtil.get(endPoint: apiConfig.getStudiosWithMostWins(NoParams())))
          .thenAnswer((_) async => const Right(invalidStudiosJson));

      // Act
      final DataSourceFailure? result =
      (await dataSource.getStudiosWithMostWins(NoParams()))
          .fold((l) => l, (r) => null);

      // Assert
      expect(result!.message.contains(expected.message),isTrue);
      verify(mockApiUtil.get(endPoint:apiConfig.getStudiosWithMostWins(NoParams()))).called(1);
    });

  });
  group('getProducersWithMaxMinInterval', () {
    test('should return max and min interval producers when the call to API is successful', () async {
      // Arrange
      when(mockApiUtil.get(endPoint: apiConfig.getProducersWithMaxMinInterval(NoParams())))
          .thenAnswer((_) async => const Right(tProducersJson));

      // Act
      final result = await dataSource.getProducersWithMaxMinInterval(NoParams());

      // Assert
      result.fold(
            (failure) => fail('Expected success but got failure: $failure'),
            (producersInterval) {
          expect(producersInterval.max.length, 1); // Verify the number of items in max
          expect(producersInterval.min.length, 1); // Verify the number of items in min
          // Verify properties of the producers
          expect(producersInterval.max[0].producer, 'Matthew Vaughn');
          expect(producersInterval.min[0].producer, 'Joel Silver');
          // Additional assertions as needed
        },
      );
      verify(mockApiUtil.get(endPoint: apiConfig.getProducersWithMaxMinInterval(NoParams()))).called(1);
    });

    test('should return empty lists for both max and min when there are no interval data', () async {
      // Arrange
      when(mockApiUtil.get(endPoint: apiConfig.getProducersWithMaxMinInterval(NoParams())))
          .thenAnswer((_) async => const Right(emptyProducersJson));

      // Act
      final result = await dataSource.getProducersWithMaxMinInterval(NoParams());

      // Assert
      result.fold(
            (failure) => fail('Expected success but got failure: $failure'),
            (producersInterval) {
          expect(producersInterval.max, isEmpty); // Check if max list is empty
          expect(producersInterval.min, isEmpty); // Check if min list is empty
        },
      );
      verify(mockApiUtil.get(endPoint: apiConfig.getProducersWithMaxMinInterval(NoParams()))).called(1);
    });

    test('should return a ParsingFailure when the content is invalid', () async {
      // Arrange
      const ParsingFailure expected = ParsingFailure(
          message: "FormatException: Unexpected character (at character 1)",
          objectToParse: "",
          stackTrace: "");
      when(mockApiUtil.get(endPoint: apiConfig.getProducersWithMaxMinInterval(NoParams())))
          .thenAnswer((_) async => const Right('Invalid JSON'));

      // Act
      final DataSourceFailure? result =
      (await dataSource.getProducersWithMaxMinInterval(NoParams()))
          .fold((l) => l, (r) => null);

      // Assert
      expect(result!.message.contains(expected.message),isTrue);
      verify(mockApiUtil.get(endPoint:apiConfig.getProducersWithMaxMinInterval(NoParams()))).called(1);
    });
  });

}
