import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_texo/domain/entities/movie.dart';
import 'package:movie_texo/domain/entities/movie_result.dart';
import 'package:movie_texo/domain/entities/pageable.dart';
import 'package:movie_texo/domain/entities/sort.dart';
import 'package:movie_texo/presentation/injection_container.dart';
import 'package:movie_texo/presentation/movies/movie_list_page.dart';
import 'package:movie_texo/presentation/cubit/movies_list/movie_list_cubit.dart';
import '../../fixtures/golden_devices.dart';
import '../cubit/movies_list/movie_list_cubit_test.mocks.dart';

void main() {
  late MovieListCubit mockMovieListCubit;
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
    mockMovieListCubit = MovieListCubit(getMovieList: mockGetMovieList);
    when(mockGetMovieList(any))
        .thenAnswer((_) async => const Right(movieResult));
    getIt.registerLazySingleton(() => mockMovieListCubit);
  });

  testGoldens("MovieListPage renders correctly when there's movies loaded",
      (tester) async {
    await loadAppFonts();
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: devices)
      ..addScenario(
        name: 'Loading State',
        widget: const MovieListPage(),
        onCreate: (scenarioWidgetKey) {
          List keysToFind = [
            const Key("movies_table"),
            const Key("app_bar"),
            const Key("filter_controls"),
            const Key("pagination_controls")
          ];
          for (var key in keysToFind) {
            final finder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(key),
            );
            expect(finder, findsOneWidget);
          }
          return Future.value(null);
        },
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'movie_list_page');
  }, tags: 'goldens');
}
