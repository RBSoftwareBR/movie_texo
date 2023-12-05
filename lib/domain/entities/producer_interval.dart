class ProducerInterval {
  final String producer;
  final int interval;
  final int previousWin;
  final int followingWin;

//<editor-fold desc="Data Methods">
  const ProducerInterval({
    required this.producer,
    required this.interval,
    required this.previousWin,
    required this.followingWin,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProducerInterval &&
          runtimeType == other.runtimeType &&
          producer == other.producer &&
          interval == other.interval &&
          previousWin == other.previousWin &&
          followingWin == other.followingWin);

  @override
  int get hashCode =>
      producer.hashCode ^
      interval.hashCode ^
      previousWin.hashCode ^
      followingWin.hashCode;

  @override
  String toString() {
    return 'ProducerWithInterval{'
        ' producer: $producer,'
        ' interval: $interval,'
        ' previousWin: $previousWin,'
        ' followingWin: $followingWin,'
        '}';
  }

  ProducerInterval copyWith({
    String? producer,
    int? interval,
    int? previousWin,
    int? followingWin,
  }) {
    return ProducerInterval(
      producer: producer ?? this.producer,
      interval: interval ?? this.interval,
      previousWin: previousWin ?? this.previousWin,
      followingWin: followingWin ?? this.followingWin,
    );
  }
//</editor-fold>
}