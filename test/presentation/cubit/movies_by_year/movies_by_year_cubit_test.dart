import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/domain/entities/movie.dart';
import 'package:movie_texo/domain/entities/movie_result.dart';
import 'package:movie_texo/domain/entities/pageable.dart';
import 'package:movie_texo/domain/entities/sort.dart';
import 'package:movie_texo/domain/use_cases/get_movies.dart';
import 'package:movie_texo/presentation/cubit/movies_by_year/movies_by_year_cubit.dart';
import 'package:movie_texo/presentation/cubit/movies_by_year/movies_by_year_state.dart';

import '../movies_list/movie_list_cubit_test.mocks.dart';


@GenerateMocks([GetMovies])
void main() {
  late MockGetMovies mockGetMovieList;
  const int testYear = 2020;

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

  group('MoviesByYearCubit', () {
    blocTest<MoviesByYearCubit, MoviesByYearState>(
      'emits [Loading, Loaded] when movies are fetched successfully for a specific year',
      build: () {
        when(mockGetMovieList(const GetMoviesParams(year: testYear, winner: true, page: 0,size: 99)))
            .thenAnswer((_) async => const Right(movieResult));
        return MoviesByYearCubit(getMovieList: mockGetMovieList);
      },
      act: (cubit) => cubit.loadMoviesByYear(testYear),
      expect: () => [
        MoviesByYearLoading(),
        isA<MoviesByYearLoaded>().having((state) => state.movies, 'movies', isNotEmpty),
      ],
    );

    blocTest<MoviesByYearCubit, MoviesByYearState>(
      'emits [Loading, Error] when fetching movies fails for a specific year',
      build: () {
        when(mockGetMovieList(const GetMoviesParams(year: testYear, winner: true, page: 0,size: 99)))
            .thenAnswer((_) async => const Left(Failure(message: 'Error', stackTrace: "")));
        return MoviesByYearCubit(getMovieList: mockGetMovieList);
      },
      act: (cubit) => cubit.loadMoviesByYear(testYear),
      expect: () => [
        MoviesByYearLoading(),
        MoviesByYearError('Error'),
      ],
    );
  });
}
