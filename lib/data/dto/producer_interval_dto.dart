import 'package:movie_texo/domain/entities/producer_interval.dart';

class ProducerIntervalDto extends ProducerInterval {

//<editor-fold desc="Data Methods">
  const ProducerIntervalDto({
    required super.producer,
    required super.interval,
    required super.previousWin,
    required super.followingWin,
  });

  Map<String, dynamic> toMap() {
    return {
      'producer': producer,
      'interval': interval,
      'previousWin': previousWin,
      'followingWin': followingWin,
    };
  }

  factory ProducerIntervalDto.fromMap(Map<String, dynamic> map) {
    return ProducerIntervalDto(
      producer: map['producer'] as String,
      interval: map['interval'] as int,
      previousWin: map['previousWin'] as int,
      followingWin: map['followingWin'] as int,
    );
  }

//</editor-fold>
}