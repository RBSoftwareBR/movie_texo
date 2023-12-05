import 'package:movie_texo/data/dto/movie_dto.dart';
import 'package:movie_texo/data/dto/pageable_dto.dart';
import 'package:movie_texo/data/dto/sort_dto.dart';
import 'package:movie_texo/domain/entities/movie.dart';
import 'package:movie_texo/domain/entities/movie_result.dart';

class MovieResultDto  extends MovieResult{

//<editor-fold desc="Data Methods">
  const MovieResultDto({
    required super.movies,
    required super.pageable,
    required super.last,
    required super.totalPages,
    required super.totalElements,
    required super.size,
    required super.number,
    required super.sort,
    required super.first,
    required super.numberOfElements,
    required super.empty,
  });

  Map<String, dynamic> toMap() {
    return {
      'content': encodeMovies(movies),
      'pageable': (pageable as PageableDto).toMap(),
      'last': last,
      'totalPages': totalPages,
      'totalElements': totalElements,
      'size': size,
      'number': number,
      'sort': (sort as SortDto).toMap(),
      'first': first,
      'numberOfElements': numberOfElements,
      'empty': empty,
    };
  }

  factory MovieResultDto.fromMap(Map<String, dynamic> map) {
    return MovieResultDto(
      movies: decodeMovies(map['content']),
      pageable: PageableDto.fromMap(map['pageable']),
      last: map['last'] as bool,
      totalPages: map['totalPages'] as int,
      totalElements: map['totalElements'] as int,
      size: map['size'] as int,
      number: map['number'] as int,
      sort: SortDto.fromMap(map['sort']),
      first: map['first'] as bool,
      numberOfElements: map['numberOfElements'] as int,
      empty: map['empty'] as bool,
    );
  }

  encodeMovies(List<Movie> movies) {
    return movies.map((e) => (e as MovieDto).toMap()).toList();
  }

  static List<MovieDto> decodeMovies(List<dynamic> map) {
    return List<MovieDto>.from(map.map((e) => MovieDto.fromMap(e)));
  }
  //</editor-fold>=
}