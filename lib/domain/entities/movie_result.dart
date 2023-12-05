import 'package:equatable/equatable.dart';
import 'package:movie_texo/domain/entities/movie.dart';
import 'package:movie_texo/domain/entities/pageable.dart';
import 'package:movie_texo/domain/entities/sort.dart';

class MovieResult  extends Equatable{
  final List<Movie> movies;
  final Pageable pageable;
  final bool last;
  final int totalPages;
  final int totalElements;
  final int size;
  final int number;
  final Sort sort;
  final bool first;
  final int numberOfElements;
  final bool empty;

  @override
  List<Object?> get props => [
    movies,
    pageable,
    last,
    totalPages,
    totalElements,
    size,
    number,
    sort,
    first,
    numberOfElements,
    empty,
  ];

//<editor-fold desc="Data Methods">
  const MovieResult({
    required this.movies,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is MovieResult &&
              runtimeType == other.runtimeType &&
              movies == other.movies &&
              pageable == other.pageable &&
              last == other.last &&
              totalPages == other.totalPages &&
              totalElements == other.totalElements &&
              size == other.size &&
              number == other.number &&
              sort == other.sort &&
              first == other.first &&
              numberOfElements == other.numberOfElements &&
              empty == other.empty
          );


  @override
  int get hashCode =>
      movies.hashCode ^
      pageable.hashCode ^
      last.hashCode ^
      totalPages.hashCode ^
      totalElements.hashCode ^
      size.hashCode ^
      number.hashCode ^
      sort.hashCode ^
      first.hashCode ^
      numberOfElements.hashCode ^
      empty.hashCode;


  @override
  String toString() {
    return 'MovieResult{'
        ' movies: $movies,'
        ' pageable: $pageable,'
        ' last: $last,'
        ' totalPages: $totalPages,'
        ' totalElements: $totalElements,'
        ' size: $size,'
        ' number: $number,'
        ' sort: $sort,'
        ' first: $first,'
        ' numberOfElements: $numberOfElements,'
        ' empty: $empty,'
        '}';
  }


  MovieResult copyWith({
    List<Movie>? movies,
    Pageable? pageable,
    bool? last,
    int? totalPages,
    int? totalElements,
    int? size,
    int? number,
    Sort? sort,
    bool? first,
    int? numberOfElements,
    bool? empty,
  }) {
    return MovieResult(
      movies: movies ?? this.movies,
      pageable: pageable ?? this.pageable,
      last: last ?? this.last,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      size: size ?? this.size,
      number: number ?? this.number,
      sort: sort ?? this.sort,
      first: first ?? this.first,
      numberOfElements: numberOfElements ?? this.numberOfElements,
      empty: empty ?? this.empty,
    );
  }
  //</editor-fold>=
}