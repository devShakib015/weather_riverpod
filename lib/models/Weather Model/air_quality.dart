import 'package:flutter/foundation.dart';

@immutable
class AirQuality {
  final double? co;
  final double? no2;
  final double? o3;
  final double? so2;
  final double? pm25;
  final double? pm10;
  final int? usEpaIndex;
  final int? gbDefraIndex;

  const AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) => AirQuality(
        co: (json['co'] as num?)?.toDouble(),
        no2: (json['no2'] as num?)?.toDouble(),
        o3: (json['o3'] as num?)?.toDouble(),
        so2: json['so2'] as double?,
        pm25: json['pm2_5'] as double?,
        pm10: (json['pm10'] as num?)?.toDouble(),
        usEpaIndex: json['us-epa-index'] as int?,
        gbDefraIndex: json['gb-defra-index'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'co': co,
        'no2': no2,
        'o3': o3,
        'so2': so2,
        'pm2_5': pm25,
        'pm10': pm10,
        'us-epa-index': usEpaIndex,
        'gb-defra-index': gbDefraIndex,
      };
}
