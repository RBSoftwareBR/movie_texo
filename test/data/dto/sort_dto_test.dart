import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/data/dto/sort_dto.dart';

void main() {
  group('SortDto Tests', () {
    test('Should create a SortDto object from a map', () {
      final map = {'unsorted': true, 'sorted': false, 'empty': true};

      final sortDto = SortDto.fromMap(map);

      expect(sortDto.unsorted, true);
      expect(sortDto.sorted, false);
      expect(sortDto.empty, true);
    });

    test('Should convert a SortDto object to a map', () {
      const sortDto = SortDto(unsorted: false, sorted: true, empty: false);

      final map = sortDto.toMap();

      expect(map['unsorted'], false);
      expect(map['sorted'], true);
      expect(map['empty'], false);
    });

    test('Should not be equal if values are different', () {
      const sortDto1 = SortDto(unsorted: true, sorted: false, empty: true);
      const sortDto2 = SortDto(unsorted: false, sorted: true, empty: false);

      expect(sortDto1, isNot(equals(sortDto2)));
    });
  });
}
