import 'package:movie_texo/domain/entities/producer_interval.dart';
import 'package:movie_texo/domain/entities/producer_interval_result.dart';

import 'producer_interval_dto.dart';

class ProducerIntervalResultDto extends ProducerIntervalResult{

//<editor-fold desc="Data Methods">
  const ProducerIntervalResultDto({
    required super.min,
    required super.max,
  });

  factory ProducerIntervalResultDto.fromMap(Map<String, dynamic> json) {
    return ProducerIntervalResultDto(
      min: json['min'] == null
          ? []
          : List<ProducerInterval>.unmodifiable(
              json['min'].map((x) => ProducerIntervalDto.fromMap(x))),
      max: json['max'] == null
          ? []
          : List<ProducerInterval>.unmodifiable(
              json['max'].map((x) => ProducerIntervalDto.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() => {
        'min': encodeProducerInterval(min),
        'max': encodeProducerInterval(max),
      };

  encodeProducerInterval(List<ProducerInterval> intervals) {
    return intervals.map((interval) {
      return {
        'producer': interval.producer,
        'interval': interval.interval,
        'previousWin': interval.previousWin,
        'followingWin': interval.followingWin,
      };
    }).toList();
  }

//</editor-fold>
}