import 'package:flutter/foundation.dart';

import 'current.dart';
import 'location.dart';

@immutable
class WeatherCurrent {
  final Location? location;
  final Current? current;

  const WeatherCurrent({this.location, this.current});

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) => WeatherCurrent(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
      };
}
