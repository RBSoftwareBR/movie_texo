import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/domain/entities/year_with_multiple_winners.dart';

void main() {
  group('YearWithMultipleWinners class tests', () {
    // Teste para verificar a criação da instância
    test('Should create a valid YearWithMultipleWinners instance', () {
      const YearWithMultipleWinners yearWithWinners = YearWithMultipleWinners(
        year: 2020,
        winnerCount: 2,
      );

      expect(yearWithWinners.year, 2020);
      expect(yearWithWinners.winnerCount, 2);
    });

    // Teste para verificar o método copyWith
    test('copyWith should modify the specified fields', () {
      const YearWithMultipleWinners yearWithWinners = YearWithMultipleWinners(
        year: 2020,
        winnerCount: 2,
      );

      final YearWithMultipleWinners modifiedYearWithWinners = yearWithWinners.copyWith(winnerCount: 3);

      expect(modifiedYearWithWinners.year, yearWithWinners.year); // não modificado
      expect(modifiedYearWithWinners.winnerCount, 3); // modificado
    });

    // Teste para verificar a igualdade e o hashCode
    test('Two instances with the same values should be equal and have the same hashCode', () {
      const YearWithMultipleWinners yearWithWinners1 = YearWithMultipleWinners(
        year: 2020,
        winnerCount: 2,
      );

      const YearWithMultipleWinners yearWithWinners2 = YearWithMultipleWinners(
        year: 2020,
        winnerCount: 2,
      );

      expect(yearWithWinners1, equals(yearWithWinners2));
      expect(yearWithWinners1.hashCode, equals(yearWithWinners2.hashCode));
    });
  });
}
