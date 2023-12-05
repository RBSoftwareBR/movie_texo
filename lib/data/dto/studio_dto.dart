import 'package:movie_texo/domain/entities/studio.dart';

class StudioDto extends Studio {
//<editor-fold desc="Data Methods">
  const StudioDto({
    required super.name,
    required super.winCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'winCount': winCount,
    };
  }

  factory StudioDto.fromMap(Map<String, dynamic> map) {
    return StudioDto(
      name: map['name'] as String,
      winCount: map['winCount'] as int,
    );
  }

//</editor-fold>
}