import 'package:equatable/equatable.dart';
import 'package:movie_texo/domain/entities/movie.dart';

class MoviesByYearState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviesByYearInitial extends MoviesByYearState {}

class MoviesByYearLoading extends MoviesByYearState {}

class MoviesByYearLoaded extends MoviesByYearState {
  final List<Movie> movies;
  MoviesByYearLoaded(this.movies);
  @override
  List<Object?> get props => [movies];
}

class MoviesByYearError extends MoviesByYearState {
  final String message;
  MoviesByYearError(this.message);
  @override
  List<Object?> get props => [message];
}