import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/domain/entities/movie.dart';
import 'package:movie_texo/domain/entities/movie_result.dart';
import 'package:movie_texo/domain/entities/pageable.dart';
import 'package:movie_texo/domain/entities/sort.dart';
import 'package:movie_texo/domain/use_cases/get_movies.dart';
import 'package:movie_texo/presentation/cubit/movies_list/movie_list_cubit.dart';
import 'package:movie_texo/presentation/cubit/movies_list/movie_list_state.dart';
import '../movies_by_year/movies_by_year_cubit_test.mocks.dart';

@GenerateMocks([GetMovies])
void main() {
  late MockGetMovies mockGetMovieList;

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
  setUp(() {
    mockGetMovieList = MockGetMovies();
  });


  group('MovieListCubit', () {
    blocTest<MovieListCubit, MovieListState>(
      'emits [Loading, Loaded] when movies are fetched successfully',
      build: () {
        when(mockGetMovieList(any)).thenAnswer((_) async => const Right(movieResult));
        return MovieListCubit(getMovieList: mockGetMovieList);
      },
      act: (cubit) => cubit.loadMovies(yearFilter: 2020, winnerFilter: true),
      expect: () => [
        MovieListLoading(),
        isA<MovieListLoaded>()
            .having((state) => state.movies, 'movies', isNotEmpty),
      ],
    );
    blocTest<MovieListCubit, MovieListState>(
      'emits [Loading, Error] when fetching movies fails',
      build: () {
        when(mockGetMovieList(any)).thenAnswer(
            (_) async => const Left(Failure(message: 'Error', stackTrace: "")));
        return MovieListCubit(getMovieList: mockGetMovieList);
      },
      act: (cubit) => cubit.loadMovies(yearFilter: 2020, winnerFilter: true),
      expect: () => [
        MovieListLoading(),
        MovieListError('Error'),
      ],
    );
  });
}
