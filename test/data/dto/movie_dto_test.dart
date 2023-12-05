import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/data/dto/movie_dto.dart';

void main() {
  group('MovieDto class tests', () {
    // Teste para verificar o método toMap
    test('should return true when comparing to other movieDto', () {
      const MovieDto movie = MovieDto(
        id: 1,
        year: 2021,
        title: 'Test Movie',
        studios: ['Test Studio'],
        producers: ['Test Producer'],
        winner: true,
      );  const MovieDto movie2 = MovieDto(
        id: 1,
        year: 2021,
        title: 'Test Movie',
        studios: ['Test Studio'],
        producers: ['Test Producer'],
        winner: true,
      );
      expect(movie, movie2);
    });
      test('toMap should return a valid map representation of the movie', () {
      const MovieDto movie = MovieDto(
        id: 1,
        year: 2021,
        title: 'Test Movie',
        studios: ['Test Studio'],
        producers: ['Test Producer'],
        winner: true,
      );

      final movieMap = movie.toMap();

      expect(movieMap, {
        'id': 1,
        'year': 2021,
        'title': 'Test Movie',
        'studios': ['Test Studio'],
        'producers': ['Test Producer'],
        'winner': true,
      });
    });

    // Teste para verificar o método fromMap
    test('fromMap should create a valid Movie instance from a map', () {
      final Map<String,dynamic> movieMap = {
        'id': 1,
        'year': 2021,
        'title': 'Test Movie',
        'studios': ['Test Studio'],
        'producers': ['Test Producer'],
        'winner': true,
      };

      final movie = MovieDto.fromMap(movieMap);

      expect(movie.id, 1);
      expect(movie.year, 2021);
      expect(movie.title, 'Test Movie');
      expect(movie.studios, ['Test Studio']);
      expect(movie.producers, ['Test Producer']);
      expect(movie.winner, true);
    });
  });
}
