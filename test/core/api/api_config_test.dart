import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/core/api/api_config.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/core/params/no_params.dart';

void main() {
  group('ApiConfig', () {
    late ApiConfig apiConfig;
    const String baseUrl = 'https://api.example.com/movies';

    setUp(() {
      apiConfig = ApiConfig(baseUrl: baseUrl);
    });

    test('getMovies returns correct URL', () {
      const GetMoviesParams params = GetMoviesParams(page: 1, size: 10, winner: true, year: 2021);
      final String url = apiConfig.getMovies(params);
      expect(url, 'https://api.example.com/movies?page=1&size=10&winner=true&year=2021');
    });

    test('getYearsWithMultipleWinners returns correct URL', () {
      final String url = apiConfig.getYearsWithMultipleWinners(NoParams());
      expect(url, 'https://api.example.com/movies?projection=years-with-multiple-winners');
    });

    test('getStudiosWithMostWins returns correct URL', () {
      final String url = apiConfig.getStudiosWithMostWins(NoParams());
      expect(url, 'https://api.example.com/movies?projection=studios-with-win-count');
    });

    test('getProducersWithMaxMinInterval returns correct URL', () {
      final String url = apiConfig.getProducersWithMaxMinInterval(NoParams());
      expect(url, 'https://api.example.com/movies?projection=max-min-win-interval-for-producers');
    });
  });
}
