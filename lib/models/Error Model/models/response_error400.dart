import 'package:flutter/foundation.dart';

import 'error.dart';

@immutable
class ResponseError400 {
  final Error error;

  const ResponseError400({required this.error});

  factory ResponseError400.fromJson(Map<String, dynamic> json) =>
      ResponseError400(
        error: Error.fromJson(json['error'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'error': error.toJson(),
      };
}
