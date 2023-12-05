import 'package:flutter_test/flutter_test.dart';
import 'package:movie_texo/domain/entities/sort.dart';

void main() {
  group('Sort Tests', () {
    // Test for object creation with expected values
    test('Should create a Sort object with expected values', () {
      const sort = Sort(unsorted: true, sorted: false, empty: true);
      expect(sort.unsorted, true);
      expect(sort.sorted, false);
      expect(sort.empty, true);
    });

    // Test for the copyWith method
    test('copyWith should update Sort correctly', () {
      const sort = Sort(unsorted: true, sorted: false, empty: true);
      final updatedSort = sort.copyWith(sorted: true);

      expect(updatedSort.unsorted, true); // unchanged
      expect(updatedSort.sorted, true); // updated
      expect(updatedSort.empty, true); // unchanged
    });

    // Test for equality comparison between objects
    test('Should compare two Sort objects correctly', () {
      const sort1 = Sort(unsorted: true, sorted: false, empty: true);
      const sort2 = Sort(unsorted: true, sorted: false, empty: true);

      expect(sort1, sort2);
      expect(sort1.hashCode, sort2.hashCode);
    });

    // Test for the toString method
    test('toString should return correct string representation', () {
      const sort = Sort(unsorted: true, sorted: false, empty: true);
      final stringRepresentation = sort.toString();

      expect(stringRepresentation.contains('Sort{'), true);
      expect(stringRepresentation.contains('unsorted: true'), true);
      expect(stringRepresentation.contains('sorted: false'), true);
      expect(stringRepresentation.contains('empty: true'), true);
    });
  });
}
