import 'package:movie_texo/data/dto/sort_dto.dart';
import 'package:movie_texo/domain/entities/pageable.dart';

class PageableDto extends Pageable {

//<editor-fold desc="Data Methods">
  const PageableDto({
    required super.sort,
    required super.offset,
    required super.pageSize,
    required super.pageNumber,
    required super.unpaged,
    required super.paged,
  });

  Map<String, dynamic> toMap() {
    return {
      'sort': (sort as SortDto).toMap(),
      'offset': offset,
      'pageSize': pageSize,
      'pageNumber': pageNumber,
      'unpaged': unpaged,
      'paged': paged,
    };
  }

  factory PageableDto.fromMap(Map<String, dynamic> map) {
    return PageableDto(
      sort: SortDto.fromMap(map['sort']),
      offset: map['offset'] as int,
      pageSize: map['pageSize'] as int,
      pageNumber: map['pageNumber'] as int,
      unpaged: map['unpaged'] as bool,
      paged: map['paged'] as bool,
    );
  }
//</editor-fold>
}