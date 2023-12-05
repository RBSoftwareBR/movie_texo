import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/data/dto/producer_interval_dto.dart';
import 'package:movie_texo/data/dto/producer_interval_result_dto.dart';
import 'package:movie_texo/domain/entities/producer_interval_result.dart';

void main() {
  group('ProducerIntervalResultDto tests', () {

    // Teste para verificar o método fromMap
    test('fromMap should create a valid ProducerIntervalResult instance', () {
      final map = {
        'min': [
          {
            'producer': 'Produtor Min',
            'interval': 1,
            'previousWin': 2010,
            'followingWin': 2011
          }
        ],
        'max': [
          {
            'producer': 'Produtor Max',
            'interval': 10,
            'previousWin': 2000,
            'followingWin': 2010
          }
        ],
      };

      final resultFromMap = ProducerIntervalResultDto.fromMap(map);

      expect(resultFromMap.min.first.producer, 'Produtor Min');
      expect(resultFromMap.max.first.producer, 'Produtor Max');
    });

    // Teste para verificar a igualdade e o hashCode
    test(
        'Two instances with the same values should be equal and have the same hashCode',
        () {
      const result1 = ProducerIntervalResult(min: [], max: []);
      const result2 = ProducerIntervalResult(min: [], max: []);

      expect(result1, equals(result2));
      expect(result1.hashCode, equals(result2.hashCode));
    });
    // Teste para verificar o método toMap
    test('toMap should return a valid map representation of ProducerIntervalResult', () {
      const minProducer = ProducerIntervalDto(producer: 'Produtor Min', interval: 1, previousWin: 2010, followingWin: 2011);
      const maxProducer = ProducerIntervalDto(producer: 'Produtor Max', interval: 10, previousWin: 2000, followingWin: 2010);
      const result = ProducerIntervalResultDto(min: [minProducer], max: [maxProducer]);

      final resultMap = result.toMap();

      expect(resultMap, isA<Map<String, dynamic>>());
      expect(resultMap['min'], isA<List>());
      expect(resultMap['max'], isA<List>());
      expect(resultMap['min'].first['producer'], 'Produtor Min');
      expect(resultMap['max'].first['producer'], 'Produtor Max');
    });
  });
}
