import 'package:movie_texo/domain/entities/sort.dart';

class SortDto extends Sort {

//<editor-fold desc="Data Methods">
  const SortDto({
    required super.unsorted,
    required super.sorted,
    required super.empty,
  });

  Map<String, dynamic> toMap() {
    return {
      'unsorted': unsorted,
      'sorted': sorted,
      'empty': empty,
    };
  }

  factory SortDto.fromMap(Map<String, dynamic> map) {
    return SortDto(
      unsorted: map['unsorted'] as bool,
      sorted: map['sorted'] as bool,
      empty: map['empty'] as bool,
    );
  }
//</editor-fold>
}
