
import 'package:movie_texo/domain/entities/movie.dart';

class MovieDto extends Movie{

//<editor-fold desc="Data Methods">
  const MovieDto({
    required super.id,
    required super.year,
    required super.title,
    required super.studios,
    required super.producers,
    required super.winner,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'year': year,
      'title': title,
      'studios': studios,
      'producers': producers,
      'winner': winner,
    };
  }

  factory MovieDto.fromMap(Map<String, dynamic> map) {
    return MovieDto(
      id: map['id'] as int,
      year: map['year'] as int,
      title: map['title'] as String,
      studios: List<String>.from(map['studios'].map((studio) => studio.toString())),
      producers: List<String>.from(map['producers'].map((producer) => producer.toString())),
      winner: map['winner'] as bool,
    );
  }
}