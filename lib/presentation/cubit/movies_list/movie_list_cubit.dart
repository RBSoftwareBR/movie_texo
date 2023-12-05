import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/domain/use_cases/get_movies.dart';
import 'package:movie_texo/presentation/cubit/movies_list/movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  final GetMovies getMovieList;
  final int pageSize = 20;
  bool hasReachedMax = false;

  MovieListCubit({required this.getMovieList}) : super(MovieListInitial());

  void loadMovies({int? yearFilter, bool? winnerFilter,int page = 0}) async {
      emit(MovieListLoading());
      final result = await getMovieList(GetMoviesParams(
          page: page,
          size: pageSize,
          year: yearFilter,
          winner: winnerFilter
      ));

      result.fold(
            (failure) => emit(MovieListError(failure.message)),
            (moviesResult) {
          emit(MovieListLoaded(movies:  moviesResult.movies, totalPages: moviesResult.totalPages, page: page));
        },
      );
  }
}