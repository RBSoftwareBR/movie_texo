import 'package:movie_texo/domain/entities/year_with_multiple_winners.dart';

class YearWithMultipleWinnersDto extends YearWithMultipleWinners {
//<editor-fold desc="Data Methods">
  const YearWithMultipleWinnersDto({
    required super.year,
    required super.winnerCount,
  });


  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'winnerCount': winnerCount,
    };
  }

  factory YearWithMultipleWinnersDto.fromMap(Map<String, dynamic> map) {
    return YearWithMultipleWinnersDto(
      year: map['year'] as int,
      winnerCount: map['winnerCount'] as int,
    );
  }
//</editor-fold>
}