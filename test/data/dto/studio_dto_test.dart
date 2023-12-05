import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/data/dto/studio_dto.dart';

void main() {
  group('StudioDto class tests', () {
    // Teste para verificar o método toMap
    test('toMap should return a valid map representation of the studio', () {
      const StudioDto studio = StudioDto(
        name: 'Test Studio',
        winCount: 3,
      );

      final Map<String,dynamic> studioMap = studio.toMap();

      expect(studioMap, {
        'name': 'Test Studio',
        'winCount': 3,
      });
    });

    // Teste para verificar o método fromMap
    test('fromMap should create a valid Studio instance from a map', () {
      final Map<String,dynamic> studioMap = {
        'name': 'Test Studio',
        'winCount': 3,
      };

      final StudioDto studio = StudioDto.fromMap(studioMap);

      expect(studio.name, 'Test Studio');
      expect(studio.winCount, 3);
    });
  });
}
