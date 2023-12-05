import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/domain/entities/producer_interval.dart';

void main() {
  group('ProducerWithInterval class tests', () {
    // Teste para verificar a criação da instância
    test('Should create a valid ProducerWithInterval instance', () {
      const ProducerInterval producer = ProducerInterval(
        producer: 'Test Producer',
        interval: 5,
        previousWin: 2015,
        followingWin: 2020,
      );

      expect(producer.producer, 'Test Producer');
      expect(producer.interval, 5);
      expect(producer.previousWin, 2015);
      expect(producer.followingWin, 2020);
    });

    // Teste para verificar o método copyWith
    test('copyWith should modify the specified fields', () {
      const ProducerInterval producer = ProducerInterval(
        producer: 'Test Producer',
        interval: 5,
        previousWin: 2015,
        followingWin: 2020,
      );

      final ProducerInterval modifiedProducer =
          producer.copyWith(interval: 10, followingWin: 2025);

      expect(modifiedProducer.producer, producer.producer); // não modificado
      expect(modifiedProducer.interval, 10); // modificado
      expect(
          modifiedProducer.previousWin, producer.previousWin); // não modificado
      expect(modifiedProducer.followingWin, 2025); // modificado
    });
    // Teste para verificar a igualdade e o hashCode
    test(
        'Two instances with the same values should be equal and have the same hashCode',
        () {
      const ProducerInterval producer1 = ProducerInterval(
        producer: 'Test Producer',
        interval: 5,
        previousWin: 2015,
        followingWin: 2020,
      );

      const ProducerInterval producer2 = ProducerInterval(
        producer: 'Test Producer',
        interval: 5,
        previousWin: 2015,
        followingWin: 2020,
      );

      expect(producer1, equals(producer2));
      expect(producer1.hashCode, equals(producer2.hashCode));
    });
  });
}
