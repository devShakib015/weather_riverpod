import 'package:flutter/material.dart';
import 'package:weather_riverpod/Views/home.dart';
import 'package:weather_riverpod/Views/search.dart';

class RouteHelper {
  RouteHelper._();

  static Map<String, WidgetBuilder> all = {
    Home.routeName: (context) => const Home(),
    Search.routeName: (context) => const Search(),
  };
}
