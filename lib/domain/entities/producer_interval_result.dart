import 'producer_interval.dart';

class ProducerIntervalResult {
  final List<ProducerInterval> min;
  final List<ProducerInterval> max;

//<editor-fold desc="Data Methods">
  const ProducerIntervalResult({
    required this.min,
    required this.max,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProducerIntervalResult &&
          runtimeType == other.runtimeType &&
          min == other.min &&
          max == other.max);

  @override
  int get hashCode => min.hashCode ^ max.hashCode;

  @override
  String toString() {
    return 'ProducerIntervalResult{ min: $min, max: $max,}';
  }

  ProducerIntervalResult copyWith({
    List<ProducerInterval>? min,
    List<ProducerInterval>? max,
  }) {
    return ProducerIntervalResult(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }
//</editor-fold>
}