import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchLocationStateProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});
