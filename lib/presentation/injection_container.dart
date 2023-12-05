// coverage:ignore-file
import 'package:get_it/get_it.dart';
import 'package:movie_texo/core/api/api_config.dart';
import 'package:movie_texo/core/api/api_util.dart';
import 'package:movie_texo/core/api/api_util_impl.dart';
import 'package:movie_texo/core/logger.dart';
import 'package:movie_texo/data/data_source/api_movie_data_source.dart';
import 'package:movie_texo/data/data_source/movie_data_source.dart';
import 'package:movie_texo/data/repositories/movie_repository_impl.dart';
import 'package:movie_texo/domain/repositories/movie_repository.dart';
import 'package:movie_texo/domain/use_cases/get_movies.dart';
import 'package:movie_texo/domain/use_cases/get_producers_with_max_min_interval.dart';
import 'package:movie_texo/domain/use_cases/get_studio_with_most_wins.dart';
import 'package:movie_texo/domain/use_cases/get_years_with_multiple_winners.dart';
import 'package:movie_texo/presentation/cubit/movies_by_year/movies_by_year_cubit.dart';
import 'package:movie_texo/presentation/cubit/movies_list/movie_list_cubit.dart';
import 'package:movie_texo/presentation/cubit/producers/producers_with_max_min_interval_cubit.dart';
import 'package:movie_texo/presentation/cubit/studios/studio_with_most_wins_cubit.dart';
import 'package:movie_texo/presentation/cubit/years/years_with_multiple_winners_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  getIt.registerLazySingleton<ApiUtil>(() => ApiUtilImpl());
  getIt.registerLazySingleton<Logger>(() => DebugLogger());
  getIt.registerLazySingleton<MovieDataSource>(() => ApiMovieDataSource(
      apiConfig: ApiConfig(baseUrl: const String.fromEnvironment("API_BASE_PATH")),
      apiUtil: getIt(),
      logger: getIt()));
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(dataSource: getIt()));

  // ----------------------------USECASES-----------------------------------
  getIt.registerLazySingleton<GetMovies>(
      () => GetMovies(repository: getIt()));
  getIt.registerLazySingleton<GetProducersWithMaxMinInterval>(
      () => GetProducersWithMaxMinInterval(repository: getIt()));
  getIt.registerLazySingleton<GetStudiosWithMostWins>(
      () => GetStudiosWithMostWins(repository: getIt()));
  getIt.registerLazySingleton<GetYearsWithMultipleWinners>(
      () => GetYearsWithMultipleWinners(repository: getIt()));


  // ----------------------------CUBITS------------------------------------
  getIt.registerLazySingleton<YearsWithMultipleWinnersCubit>(
      () => YearsWithMultipleWinnersCubit(getYearsWithMultipleWinners: getIt()));
  getIt.registerLazySingleton<StudiosWithMostWinsCubit>(
      () => StudiosWithMostWinsCubit(getStudiosWithMostWins: getIt()));
  getIt.registerLazySingleton<ProducersWithMaxMinIntervalCubit>(
      () => ProducersWithMaxMinIntervalCubit(getProducersWithMaxMinInterval: getIt()));
  getIt.registerLazySingleton<MovieListCubit>(
      () => MovieListCubit(getMovieList: getIt()));
  getIt.registerLazySingleton<MoviesByYearCubit>(
      () => MoviesByYearCubit(getMovieList: getIt()));
}
