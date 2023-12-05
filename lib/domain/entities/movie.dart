
import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final int year;
  final String title;
  final List<String> studios;
  final List<String> producers;
  final bool winner;

//<editor-fold desc="Data Methods">
  const Movie({
    required this.id,
    required this.year,
    required this.title,
    required this.studios,
    required this.producers,
    required this.winner,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          year == other.year &&
          title == other.title &&
          studios == other.studios &&
          producers == other.producers &&
          winner == other.winner);

  @override
  int get hashCode =>
      id.hashCode ^
      year.hashCode ^
      title.hashCode ^
      studios.hashCode ^
      producers.hashCode ^
      winner.hashCode;

  @override
  String toString() {
    return 'Movie{'
        ' id: $id,'
        ' year: $year,'
        ' title: $title,'
        ' studios: $studios,'
        ' producers: $producers,'
        ' winner: $winner,'
        '}';
  }

  Movie copyWith({
    int? id,
    int? year,
    String? title,
    List<String>? studios,
    List<String>? producers,
    bool? winner,
  }) {
    return Movie(
      id: id ?? this.id,
      year: year ?? this.year,
      title: title ?? this.title,
      studios: studios ?? this.studios,
      producers: producers ?? this.producers,
      winner: winner ?? this.winner,
    );
  }

  @override
  List<Object?> get props => [
    id,
    year,
    title,
    studios,
    producers,
    winner,
  ];
//</editor-fold>
}