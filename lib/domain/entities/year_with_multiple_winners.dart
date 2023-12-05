class YearWithMultipleWinners {
  final int year;
  final int winnerCount;

//<editor-fold desc="Data Methods">
  const YearWithMultipleWinners({
    required this.year,
    required this.winnerCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is YearWithMultipleWinners &&
          runtimeType == other.runtimeType &&
          year == other.year &&
          winnerCount == other.winnerCount);

  @override
  int get hashCode => year.hashCode ^ winnerCount.hashCode;

  @override
  String toString() {
    return 'AnoComMultiplosVencedores{'
        ' year: $year,'
        ' winnerCount: $winnerCount,'
        '}';
  }

  YearWithMultipleWinners copyWith({
    int? year,
    int? winnerCount,
  }) {
    return YearWithMultipleWinners(
      year: year ?? this.year,
      winnerCount: winnerCount ?? this.winnerCount,
    );
  }
//</editor-fold>
}