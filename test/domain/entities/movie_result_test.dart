import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/domain/entities/movie.dart';
import 'package:movie_texo/domain/entities/movie_result.dart';
import 'package:movie_texo/domain/entities/pageable.dart';
import 'package:movie_texo/domain/entities/sort.dart';

void main() {
  group('MovieResult Tests', () {
    // Sample data to be used in tests
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

    test('Should create a MovieResult with expected values', () {
      expect(movieResult.movies, movies);
      expect(movieResult.pageable, pageable);
      expect(movieResult.last, false);
      expect(movieResult.totalPages, 10);
      expect(movieResult.totalElements, 100);
      expect(movieResult.size, 10);
      expect(movieResult.number, 1);
      expect(movieResult.sort, sort);
      expect(movieResult.first, true);
      expect(movieResult.numberOfElements, 2);
      expect(movieResult.empty, false);
    });

    test('copyWith should update MovieResult correctly', () {
      final updatedMovieResult = movieResult.copyWith(last: true, size: 20);

      expect(updatedMovieResult.last, true);
      expect(updatedMovieResult.size, 20);
      expect(
          updatedMovieResult.totalPages, movieResult.totalPages); // unchanged
    });

    test('Should compare two MovieResult objects correctly', () {
      const movieResult2 = MovieResult(
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

      expect(movieResult, movieResult2);
      expect(movieResult.hashCode, movieResult2.hashCode);
    });
    test('toString should return correct string representation', () {
      final stringRepresentation = movieResult.toString();

      // The string representation should contain the class name and all the properties.
      expect(stringRepresentation.contains('MovieResult{'), true);
      expect(stringRepresentation.contains('movies:'), true);
      expect(stringRepresentation.contains('pageable:'), true);
      expect(stringRepresentation.contains('last:'), true);
      expect(stringRepresentation.contains('totalPages:'), true);
      expect(stringRepresentation.contains('totalElements:'), true);
      expect(stringRepresentation.contains('size:'), true);
      expect(stringRepresentation.contains('number:'), true);
      expect(stringRepresentation.contains('sort:'), true);
      expect(stringRepresentation.contains('first:'), true);
      expect(stringRepresentation.contains('numberOfElements:'), true);
      expect(stringRepresentation.contains('empty:'), true);

      // The string representation should include the values of the properties.
      expect(stringRepresentation.contains('${movieResult.movies}'), true);
      expect(stringRepresentation.contains('${movieResult.pageable}'), true);
      expect(stringRepresentation.contains('${movieResult.last}'), true);
      expect(stringRepresentation.contains('${movieResult.totalPages}'), true);
      expect(
          stringRepresentation.contains('${movieResult.totalElements}'), true);
      expect(stringRepresentation.contains('${movieResult.size}'), true);
      expect(stringRepresentation.contains('${movieResult.number}'), true);
      expect(stringRepresentation.contains('${movieResult.sort}'), true);
      expect(stringRepresentation.contains('${movieResult.first}'), true);
      expect(stringRepresentation.contains('${movieResult.numberOfElements}'),
          true);
      expect(stringRepresentation.contains('${movieResult.empty}'), true);
    });
    test('Should not equate two MovieResult objects with different data', () {
      const differentMovieResult = MovieResult(
        movies: [ ],
        pageable: pageable,
        last: true,
        totalPages: 5,
        totalElements: 50,
        size: 5,
        number: 2,
        sort: sort,
        first: false,
        numberOfElements: 1,
        empty: true,
      );

      expect(movieResult == differentMovieResult, false);
    });

  });
}
