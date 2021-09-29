import 'package:flutter/foundation.dart';

@immutable
class SearchLocationResult {
  final int? id;
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? url;

  const SearchLocationResult({
    this.id,
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.url,
  });

  factory SearchLocationResult.fromJson(Map<String, dynamic> json) =>
      SearchLocationResult(
        id: json['id'] as int?,
        name: json['name'] as String?,
        region: json['region'] as String?,
        country: json['country'] as String?,
        lat: (json['lat'] as num?)?.toDouble(),
        lon: (json['lon'] as num?)?.toDouble(),
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'url': url,
      };
}
