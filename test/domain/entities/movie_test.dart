import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/domain/entities/movie.dart';

void main() {
  group('Movie class tests', () {
    // Teste para verificar a criação da instância
    test('Should create a valid Movie instance', () {
      const Movie movie = Movie(
        id: 1,
        year: 2021,
        title: 'Test Movie',
        studios: ['Test Studio'],
        producers: ['Test Producer'],
        winner: true,
      );

      expect(movie.id, 1);
      expect(movie.year, 2021);
      expect(movie.title, 'Test Movie');
      expect(movie.studios, ['Test Studio']);
      expect(movie.producers, ['Test Producer']);
      expect(movie.winner, true);
    });

    // Teste para verificar o método copyWith
    test('copyWith should modify the specified fields', () {
      const Movie movie = Movie(
        id: 1,
        year: 2021,
        title: 'Test Movie',
        studios: ['Test Studio'],
        producers: ['Test Producer'],
        winner: true,
      );

      final modifiedMovie = movie.copyWith(title: 'New Title', winner: false);

      expect(modifiedMovie.id, movie.id); // não modificado
      expect(modifiedMovie.year, movie.year); // não modificado
      expect(modifiedMovie.title, 'New Title'); // modificado
      expect(modifiedMovie.winner, false); // modificado
    });

    // Teste para verificar a igualdade e o hashCode
    test('Two instances with the same values should be equal and have the same hashCode', () {
      const Movie movie1 = Movie(
        id: 1,
        year: 2021,
        title: 'Test Movie',
        studios: ['Test Studio'],
        producers: ['Test Producer'],
        winner: true,
      );

      const Movie movie2 = Movie(
        id: 1,
        year: 2021,
        title: 'Test Movie',
        studios: ['Test Studio'],
        producers: ['Test Producer'],
        winner: true,
      );

      expect(movie1, equals(movie2));
      expect(movie1.hashCode, equals(movie2.hashCode));
    });
  });
}
