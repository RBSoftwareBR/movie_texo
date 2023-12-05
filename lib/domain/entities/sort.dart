import 'package:equatable/equatable.dart';

class Sort extends Equatable {
  final bool unsorted;
  final bool sorted;
  final bool empty;

//<editor-fold desc="Data Methods">
  const Sort({
    required this.unsorted,
    required this.sorted,
    required this.empty,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sort &&
          runtimeType == other.runtimeType &&
          unsorted == other.unsorted &&
          sorted == other.sorted &&
          empty == other.empty);

  @override
  int get hashCode => unsorted.hashCode ^ sorted.hashCode ^ empty.hashCode;

  @override
  String toString() {
    return 'Sort{'
        ' unsorted: $unsorted,'
        ' sorted: $sorted,'
        ' empty: $empty,'
        '}';
  }

  Sort copyWith({
    bool? unsorted,
    bool? sorted,
    bool? empty,
  }) {
    return Sort(
      unsorted: unsorted ?? this.unsorted,
      sorted: sorted ?? this.sorted,
      empty: empty ?? this.empty,
    );
  }

  @override
  List<Object?> get props => [
        unsorted,
        sorted,
        empty,
      ];
//</editor-fold>
}
