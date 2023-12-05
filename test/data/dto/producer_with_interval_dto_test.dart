import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/data/dto/producer_interval_dto.dart';

void main() {
  group('ProducerWithIntervalDto class tests', () {
    // Teste para verificar o método toMap
    test('toMap should return a valid map representation of the producer', () {
      const ProducerIntervalDto producer = ProducerIntervalDto(
        producer: 'Test Producer',
        interval: 5,
        previousWin: 2015,
        followingWin: 2020,
      );

      final producerMap = producer.toMap();

      expect(producerMap, {
        'producer': 'Test Producer',
        'interval': 5,
        'previousWin': 2015,
        'followingWin': 2020,
      });
    });

    // Teste para verificar o método fromMap
    test(
        'fromMap should create a valid ProducerWithIntervalDto instance from a map',
        () {
      final Map<String,dynamic> producerMap = {
        'producer': 'Test Producer',
        'interval': 5,
        'previousWin': 2015,
        'followingWin': 2020,
      };

      final ProducerIntervalDto producer =
      ProducerIntervalDto.fromMap(producerMap);

      expect(producer.producer, 'Test Producer');
      expect(producer.interval, 5);
      expect(producer.previousWin, 2015);
      expect(producer.followingWin, 2020);
    });
  });
}
