import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/core/params/no_params.dart';

class ApiConfig {
  final String baseUrl;
  ApiConfig({required this.baseUrl});

  String getMovies(GetMoviesParams params) {
    return '$baseUrl?page=${params.page}&size=${params.size}${params.winner == null?"": "&winner=${params.winner}"}${params.year==null? "":"&year=${params.year}"}';
  }

  String getYearsWithMultipleWinners(NoParams params) {
    return '$baseUrl?projection=years-with-multiple-winners';
  }

  String getStudiosWithMostWins(NoParams params) {
    return '$baseUrl?projection=studios-with-win-count';
  }

  String getProducersWithMaxMinInterval(NoParams params) {
    return '$baseUrl?projection=max-min-win-interval-for-producers';
  }
}