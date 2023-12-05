import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/domain/use_cases/get_movies.dart';
import 'package:movie_texo/presentation/cubit/movies_by_year/movies_by_year_state.dart';

class MoviesByYearCubit extends Cubit<MoviesByYearState> {
  final GetMovies getMovieList;

  MoviesByYearCubit({required this.getMovieList})
      : super(MoviesByYearInitial());

  Future<void> loadMoviesByYear(int year) async {
    emit(MoviesByYearLoading());
    final params = GetMoviesParams(year: year, winner: true, page: 0, size: 99);
    final result = await getMovieList(params);
    result.fold(
      (failure) => emit(MoviesByYearError(failure.message)),
      (moviesResults) => emit(MoviesByYearLoaded(moviesResults.movies)),
    );
  }
}
