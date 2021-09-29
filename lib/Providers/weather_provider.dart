import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:weather_riverpod/Helpers/api_helper.dart';
import 'package:weather_riverpod/Helpers/network_helper.dart';
import 'package:weather_riverpod/Providers/city_provider.dart';
import 'package:weather_riverpod/Providers/search_location_provider.dart';
import 'package:weather_riverpod/models/Weather%20Model/weather_current.dart';
import 'package:weather_riverpod/models/Weather%20Model/search_location.dart';

final currentWeatherProvider = FutureProvider<WeatherCurrent?>((ref) async {
  final city = ref.watch(cityStateProvider).state;
  return WeatherProvider.getWeather(city.name);
});

final locationSearchProvider =
    FutureProvider.autoDispose<List<SearchLocationResult>?>((ref) async {
  final _query = ref.watch(searchLocationStateProvider).state;
  return WeatherProvider.getLocationQuery(_query);
});

class WeatherProvider {
  static Future<WeatherCurrent?> getWeather(String cityName) async {
    final http.Response _response =
        await NetworkHelper.getData(ApiHelper.currentWeatherUrl(cityName));

    if (_response.statusCode == 200) {
      return WeatherCurrent.fromJson(json.decode(_response.body));
    }
  }

  static Future<List<SearchLocationResult>?> getLocationQuery(
      String query) async {
    List<SearchLocationResult> _results = [];
    final http.Response _response =
        await NetworkHelper.getData(ApiHelper.searchLocationUrl(query));

    if (_response.statusCode == 200) {
      final _data = json.decode(_response.body);
      for (var item in _data) {
        _results.add(SearchLocationResult.fromJson(item));
      }
      return _results;
    }
  }
}
