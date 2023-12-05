import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/data/dto/movie_dto.dart';
import 'package:movie_texo/data/dto/movie_result_dto.dart';
import 'package:movie_texo/data/dto/pageable_dto.dart';
import 'package:movie_texo/data/dto/sort_dto.dart';

void main() {
  group('MovieResultDto Tests', () {
    final movies = [
      const MovieDto(id: 1, year: 1980, title: 'Can\'t Stop the Music', studios: ['Studio A'], producers: ['Producer A'], winner: true),
    ];
    const sort = SortDto(unsorted: false, sorted: true, empty: false);
    const pageable = PageableDto(offset: 0, pageSize: 10, pageNumber: 1, paged: true, unpaged: false, sort: sort);

    test('Should create a MovieResultDto object from a map', () {
      final map = {
        'content': movies.map((movie) => movie.toMap()).toList(),
        'pageable': pageable.toMap(),
        'last': false,
        'totalPages': 100,
        'totalElements': 2000,
        'size': 10,
        'number': 1,
        'sort': sort.toMap(),
        'first': true,
        'numberOfElements': 2,
        'empty': false,
      };

      final movieResultDto = MovieResultDto.fromMap(map);
      expect(movieResultDto.movies[0].title, equals(movies[0].title));
      expect(movieResultDto.pageable, equals(pageable));
      expect(movieResultDto.last, equals(false));
      expect(movieResultDto.totalPages, equals(100));
      expect(movieResultDto.totalElements, equals(2000));
      expect(movieResultDto.size, equals(10));
      expect(movieResultDto.number, equals(1));
      expect(movieResultDto.sort, equals(sort));
      expect(movieResultDto.first, equals(true));
      expect(movieResultDto.numberOfElements, equals(2));


    });

    test('Should convert a MovieResultDto object to a map', () {
      final movieResultDto = MovieResultDto(
        movies: movies,
        pageable: pageable,
        last: false,
        totalPages: 100,
        totalElements: 2000,
        size: 10,
        number: 1,
        sort: sort,
        first: true,
        numberOfElements: 2,
        empty: false,
      );

      final map = movieResultDto.toMap();

      expect(map['content'], equals(movies.map((movie) => (movie).toMap()).toList()));
      expect(map['pageable'], equals((pageable).toMap()));
      expect(map['pageable'], equals((pageable).toMap()));
      expect(map['last'], equals(movieResultDto.last));
      expect(map['totalPages'], equals(movieResultDto.totalPages));
      expect(map['totalElements'], equals(movieResultDto.totalElements));
      expect(map['size'], equals(movieResultDto.size));
      expect(map['number'], equals(movieResultDto.number));
      expect(map['sort'], equals((sort).toMap()));
      expect(map['first'], equals(movieResultDto.first));
      expect(map['numberOfElements'], equals(movieResultDto.numberOfElements));
      expect(map['empty'], equals(movieResultDto.empty));
    });
  });
}
