import 'package:equatable/equatable.dart';
import 'package:movie_texo/domain/entities/sort.dart';

class Pageable extends Equatable {
  final Sort sort;
  final int offset;
  final int pageSize;
  final int pageNumber;
  final bool unpaged;
  final bool paged;

//<editor-fold desc="Data Methods">
  const Pageable({
    required this.sort,
    required this.offset,
    required this.pageSize,
    required this.pageNumber,
    required this.unpaged,
    required this.paged,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pageable &&
          runtimeType == other.runtimeType &&
          sort == other.sort &&
          offset == other.offset &&
          pageSize == other.pageSize &&
          pageNumber == other.pageNumber &&
          unpaged == other.unpaged &&
          paged == other.paged);

  @override
  int get hashCode =>
      sort.hashCode ^
      offset.hashCode ^
      pageSize.hashCode ^
      pageNumber.hashCode ^
      unpaged.hashCode ^
      paged.hashCode;

  @override
  String toString() {
    return 'Pageable{'
        ' sort: $sort,'
        ' offset: $offset,'
        ' pageSize: $pageSize,'
        ' pageNumber: $pageNumber,'
        ' unpaged: $unpaged,'
        ' paged: $paged,'
        '}';
  }

  Pageable copyWith({
    Sort? sort,
    int? offset,
    int? pageSize,
    int? pageNumber,
    bool? unpaged,
    bool? paged,
  }) {
    return Pageable(
      sort: sort ?? this.sort,
      offset: offset ?? this.offset,
      pageSize: pageSize ?? this.pageSize,
      pageNumber: pageNumber ?? this.pageNumber,
      unpaged: unpaged ?? this.unpaged,
      paged: paged ?? this.paged,
    );
  }

  @override
  List<Object?> get props => [
    sort,
    offset,
    pageSize,
    pageNumber,
    unpaged,
    paged,
  ];

//</editor-fold>
}