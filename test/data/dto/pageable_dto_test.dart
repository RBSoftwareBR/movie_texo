import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/data/dto/pageable_dto.dart';
import 'package:movie_texo/data/dto/sort_dto.dart';

void main() {
  group('PageableDto Tests', () {
    test('Should create a PageableDto object from a map', () {
      const sortDto = SortDto(unsorted: true, sorted: false, empty: true);
      final map = {
        'sort': sortDto.toMap(),
        'offset': 10,
        'pageSize': 20,
        'pageNumber': 1,
        'unpaged': false,
        'paged': true
      };

      final pageableDto = PageableDto.fromMap(map);

      expect(pageableDto.sort, sortDto);
      expect(pageableDto.offset, 10);
      expect(pageableDto.pageSize, 20);
      expect(pageableDto.pageNumber, 1);
      expect(pageableDto.unpaged, false);
      expect(pageableDto.paged, true);
    });

    test('Should convert a PageableDto object to a map', () {
      const sortDto = SortDto(unsorted: false, sorted: true, empty: false);
      const pageableDto = PageableDto(
          sort: sortDto,
          offset: 10,
          pageSize: 20,
          pageNumber: 1,
          unpaged: false,
          paged: true
      );

      final map = pageableDto.toMap();

      expect(map['sort'], sortDto.toMap());
      expect(map['offset'], 10);
      expect(map['pageSize'], 20);
      expect(map['pageNumber'], 1);
      expect(map['unpaged'], false);
      expect(map['paged'], true);
    });

    test('Should not be equal if values are different', () {
      const sortDto1 = SortDto(unsorted: true, sorted: false, empty: true);
      const pageableDto1 = PageableDto(
          sort: sortDto1,
          offset: 10,
          pageSize: 20,
          pageNumber: 1,
          unpaged: false,
          paged: true
      );

      const sortDto2 = SortDto(unsorted: false, sorted: true, empty: false);
      const pageableDto2 = PageableDto(
          sort: sortDto2,
          offset: 5,
          pageSize: 10,
          pageNumber: 2,
          unpaged: true,
          paged: false
      );

      expect(pageableDto1, isNot(equals(pageableDto2)));
    });
  });
}
