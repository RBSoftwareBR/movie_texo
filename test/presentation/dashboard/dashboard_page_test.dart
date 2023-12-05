import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/entities/movie.dart';
import 'package:movie_texo/domain/entities/movie_result.dart';
import 'package:movie_texo/domain/entities/pageable.dart';
import 'package:movie_texo/domain/entities/producer_interval.dart';
import 'package:movie_texo/domain/entities/producer_interval_result.dart';
import 'package:movie_texo/domain/entities/sort.dart';
import 'package:movie_texo/domain/entities/studio.dart';
import 'package:movie_texo/domain/entities/year_with_multiple_winners.dart';
import 'package:movie_texo/presentation/cubit/movies_by_year/movies_by_year_cubit.dart';
import 'package:movie_texo/presentation/cubit/producers/producers_with_max_min_interval_cubit.dart';
import 'package:movie_texo/presentation/cubit/studios/studio_with_most_wins_cubit.dart';
import 'package:movie_texo/presentation/cubit/years/years_with_multiple_winners_cubit.dart';
import 'package:movie_texo/presentation/dashboard/dashboard_page.dart';
import 'package:movie_texo/presentation/injection_container.dart';

import '../../fixtures/golden_devices.dart';
import '../cubit/movies_by_year/movies_by_year_cubit_test.mocks.dart';
import '../cubit/producers/producers_with_max_min_interval_cubit_test.mocks.dart';
import '../cubit/studios/studio_with_most_wins_cubit_test.mocks.dart';
import '../cubit/years/years_with_multiple_winners_cubit_test.mocks.dart';

void main() {
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

  late YearsWithMultipleWinnersCubit mockYearsCubit;
  late StudiosWithMostWinsCubit mockStudiosCubit;
  late ProducersWithMaxMinIntervalCubit mockProducersCubit;
  late MockGetYearsWithMultipleWinners mockGetYearsWithMultipleWinners;
  late MockGetProducersWithMaxMinInterval mockGetProducersWithMaxMinInterval;
  late MockGetStudiosWithMostWins mockGetStudiosWithMostWins;
  late MockGetMovies mockGetMovieList;
  late MoviesByYearCubit moviesByYearCubit;

  setUp(() {
    //Usecases
    mockGetMovieList = MockGetMovies();
    mockGetProducersWithMaxMinInterval = MockGetProducersWithMaxMinInterval();
    mockGetStudiosWithMostWins = MockGetStudiosWithMostWins();
    mockGetYearsWithMultipleWinners = MockGetYearsWithMultipleWinners();

    //Cubits
    mockYearsCubit = YearsWithMultipleWinnersCubit(
        getYearsWithMultipleWinners: mockGetYearsWithMultipleWinners);
    mockStudiosCubit = StudiosWithMostWinsCubit(
        getStudiosWithMostWins: mockGetStudiosWithMostWins);
    mockProducersCubit = ProducersWithMaxMinIntervalCubit(
        getProducersWithMaxMinInterval: mockGetProducersWithMaxMinInterval);
    moviesByYearCubit = MoviesByYearCubit(getMovieList: mockGetMovieList);

    //Mocking usecases
    when(mockGetYearsWithMultipleWinners(NoParams())).thenAnswer((_) async =>
        const Right([YearWithMultipleWinners(year: 1980, winnerCount: 2)]));
    when(mockGetStudiosWithMostWins(NoParams()))
        .thenAnswer((_) async => const Right([
              Studio(name: 'Studio A', winCount: 3),
              Studio(name: 'Studio B', winCount: 3),
              Studio(name: 'Studio C', winCount: 3)
            ]));
    const producerIntervalResult = ProducerIntervalResult(
      max: [
        ProducerInterval(
            producer: 'Producer Max',
            interval: 10,
            previousWin: 2000,
            followingWin: 2010)
      ],
      min: [
        ProducerInterval(
            producer: 'Producer Min',
            interval: 1,
            previousWin: 2018,
            followingWin: 2019)
      ],
    );
    when(mockGetProducersWithMaxMinInterval(NoParams()))
        .thenAnswer((_) async => const Right(producerIntervalResult));
    when(mockGetMovieList(
            const GetMoviesParams(year: 1990, winner: true, page: 0, size: 99)))
        .thenAnswer((_) async => const Right(movieResult));

    //Injection
    getIt.registerLazySingleton<YearsWithMultipleWinnersCubit>(
        () => mockYearsCubit);
    getIt.registerLazySingleton<StudiosWithMostWinsCubit>(
        () => mockStudiosCubit);
    getIt.registerLazySingleton<ProducersWithMaxMinIntervalCubit>(
        () => mockProducersCubit);
    getIt.registerLazySingleton<MoviesByYearCubit>(() => moviesByYearCubit);
  });

  testGoldens('DashboardPage renders correctly', (tester) async {
    await loadAppFonts();
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: devices)
      ..addScenario(
        name: 'Dashboard with data',
        widget: const DashboardPage(),
        onCreate: (scenarioWidgetKey) {
          List keysToFind = [
            const Key("years_table"),
            const Key("studios_table"),
            const Key("producers_table"),
            const Key("movies_table"),
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
    await screenMatchesGolden(tester, 'dashboard_page_default');
  },tags: 'goldens');
}
