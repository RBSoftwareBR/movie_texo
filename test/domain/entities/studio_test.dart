import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/domain/entities/studio.dart';

void main() {
  group('Studio class tests', () {
    // Teste para verificar a criação da instância
    test('Should create a valid Studio instance', () {
      const Studio studio = Studio(
        name: 'Test Studio',
        winCount: 3,
      );

      expect(studio.name, 'Test Studio');
      expect(studio.winCount, 3);
    });

    // Teste para verificar o método copyWith
    test('copyWith should modify the specified fields', () {
      const Studio studio = Studio(
        name: 'Test Studio',
        winCount: 3,
      );

      final Studio modifiedStudio = studio.copyWith(winCount: 4);

      expect(modifiedStudio.name, studio.name); // não modificado
      expect(modifiedStudio.winCount, 4); // modificado
    });

    // Teste para verificar a igualdade e o hashCode
    test('Two instances with the same values should be equal and have the same hashCode', () {
      const Studio studio1 = Studio(
        name: 'Test Studio',
        winCount: 3,
      );

      const Studio studio2 = Studio(
        name: 'Test Studio',
        winCount: 3,
      );

      expect(studio1, equals(studio2));
      expect(studio1.hashCode, equals(studio2.hashCode));
    });
  });
}
