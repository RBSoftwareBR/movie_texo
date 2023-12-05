class Studio {
  final String name;
  final int winCount;

//<editor-fold desc="Data Methods">
  const Studio({
    required this.name,
    required this.winCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Studio &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          winCount == other.winCount);

  @override
  int get hashCode => name.hashCode ^ winCount.hashCode;


  @override
  String toString() {
    return 'Studio{name: $name, winCount: $winCount}';
  }

  Studio copyWith({
    String? name,
    int? winCount,
  }) {
    return Studio(
      name: name ?? this.name,
      winCount: winCount ?? this.winCount,
    );
  }

//</editor-fold>
}