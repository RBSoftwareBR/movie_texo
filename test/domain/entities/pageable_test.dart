import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/domain/entities/pageable.dart';
import 'package:movie_texo/domain/entities/sort.dart';

void main() {
  group('Pageable Tests', () {
    // Setup common variables for tests
    const sort = Sort(unsorted: true, sorted: false, empty: false);

    test('Should create a Pageable object with expected values', () {
      const pageable = Pageable(
        sort: sort,
        offset: 0,
        pageSize: 10,
        pageNumber: 1,
        unpaged: false,
        paged: true,
      );

      expect(pageable.sort, sort);
      expect(pageable.offset, 0);
      expect(pageable.pageSize, 10);
      expect(pageable.pageNumber, 1);
      expect(pageable.unpaged, false);
      expect(pageable.paged, true);
    });

    test('copyWith should update Pageable correctly', () {
      const pageable = Pageable(
        sort: sort,
        offset: 0,
        pageSize: 10,
        pageNumber: 1,
        unpaged: false,
        paged: true,
      );
      final updatedPageable = pageable.copyWith(pageNumber: 2, pageSize: 20);

      expect(updatedPageable.pageNumber, 2);
      expect(updatedPageable.pageSize, 20);
      expect(updatedPageable.sort, pageable.sort); // unchanged
    });

    test('Should compare two Pageable objects correctly', () {
      const pageable1 = Pageable(
        sort: sort,
        offset: 0,
        pageSize: 10,
        pageNumber: 1,
        unpaged: false,
        paged: true,
      );
      const pageable2 = Pageable(
        sort: sort,
        offset: 0,
        pageSize: 10,
        pageNumber: 1,
        unpaged: false,
        paged: true,
      );

      expect(pageable1, pageable2);
      expect(pageable1.hashCode, pageable2.hashCode);
    });

    test('toString should return correct string representation', () {
      const pageable = Pageable(
        sort: sort,
        offset: 0,
        pageSize: 10,
        pageNumber: 1,
        unpaged: false,
        paged: true,
      );
      final stringRepresentation = pageable.toString();

      expect(stringRepresentation.contains('Pageable{'), true);
      expect(stringRepresentation.contains('sort:'), true);
      expect(stringRepresentation.contains('offset:'), true);
      expect(stringRepresentation.contains('pageSize:'), true);
      expect(stringRepresentation.contains('pageNumber:'), true);
      expect(stringRepresentation.contains('unpaged:'), true);
      expect(stringRepresentation.contains('paged:'), true);
    });
  });
}
