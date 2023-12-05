import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/domain/entities/producer_interval.dart';
import 'package:movie_texo/domain/entities/producer_interval_result.dart';

void main() {
  group('ProducerIntervalResult tests', () {
    // Teste para verificar a criação da instância
    test('Should create a valid ProducerIntervalResult instance', () {
      const ProducerInterval minProducer = ProducerInterval(
          producer: 'Produtor Min',
          interval: 1,
          previousWin: 2010,
          followingWin: 2011);
      const ProducerInterval maxProducer = ProducerInterval(
          producer: 'Produtor Max',
          interval: 10,
          previousWin: 2000,
          followingWin: 2010);
      const ProducerIntervalResult result =
          ProducerIntervalResult(min: [minProducer], max: [maxProducer]);

      expect(result.min.length, 1);
      expect(result.max.length, 1);
      expect(result.min.first, minProducer);
      expect(result.max.first, maxProducer);
    });

    // Teste para verificar o método copyWith
    test('copyWith should modify the specified fields', () {
      const ProducerIntervalResult initialResult =
          ProducerIntervalResult(min: [], max: []);
      final updatedMin = [
        const ProducerInterval(
            producer: 'Updated Min',
            interval: 2,
            previousWin: 2011,
            followingWin: 2013)
      ];
      final updatedMax = [
        const ProducerInterval(
            producer: 'Updated Max',
            interval: 12,
            previousWin: 2001,
            followingWin: 2013)
      ];

      final updatedResult =
          initialResult.copyWith(min: updatedMin, max: updatedMax);

      expect(updatedResult.min.first.producer, 'Updated Min');
      expect(updatedResult.max.first.producer, 'Updated Max');
    });
  });
}
