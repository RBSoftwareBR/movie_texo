import 'package:equatable/equatable.dart';
import 'package:movie_texo/domain/entities/movie.dart';

abstract class MovieListState extends Equatable {}

class MovieListInitial extends MovieListState {
  @override
  List<Object?> get props => [];
}

class MovieListLoading extends MovieListState {
  @override
  List<Object?> get props => [];
}

class MovieListLoaded extends MovieListState {
  final List<Movie> movies;
  final int totalPages;
  final int page;


  MovieListLoaded({required this.movies, required this.totalPages, required this.page});
  @override
  List<Object?> get props => [movies,totalPages,page];
}

class MovieListError extends MovieListState {
  final String message;

  MovieListError(this.message);
  @override
  List<Object?> get props => [message];
}

