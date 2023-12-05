import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/data/dto/year_with_multiple_winners_dto.dart';

void main() {
  group('YearWithMultipleWinnersDto class tests', () {
    // Teste para verificar o método toMap
    test('toMap should return a valid map representation of the year with winners', () {
      const YearWithMultipleWinnersDto yearWithWinners = YearWithMultipleWinnersDto(
        year: 2020,
        winnerCount: 2,
      );

      final yearWithWinnersMap = yearWithWinners.toMap();

      expect(yearWithWinnersMap, {
        'year': 2020,
        'winnerCount': 2,
      });
    });

    // Teste para verificar o método fromMap
    test('fromMap should create a valid YearWithMultipleWinnersDto instance from a map', () {
      final Map<String,dynamic> yearWithWinnersMap = {
        'year': 2020,
        'winnerCount': 2,
      };

      final YearWithMultipleWinnersDto yearWithWinners = YearWithMultipleWinnersDto.fromMap(yearWithWinnersMap);

      expect(yearWithWinners.year, 2020);
      expect(yearWithWinners.winnerCount, 2);
    });

  });
}
