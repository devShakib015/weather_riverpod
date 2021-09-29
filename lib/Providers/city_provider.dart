import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/models/City%20Model/city_model.dart';

final cityStateProvider = StateProvider<CityModel>((ref) {
  return _cityList.first;
});

final allCityProvider = Provider<List<CityModel>>((ref) {
  _cityList.sort((a, b) => a.name.compareTo(b.name));
  return _cityList;
});

List<CityModel> _cityList = [
  CityModel(name: 'London'),
  CityModel(name: 'New York'),
  CityModel(name: 'Tokyo'),
  CityModel(name: 'Paris'),
  CityModel(name: 'Berlin'),
  CityModel(name: 'Moscow'),
  CityModel(name: 'Rome'),
  CityModel(name: 'Madrid'),
  CityModel(name: 'Barcelona'),
  CityModel(name: 'Munich'),
  CityModel(name: 'Milan'),
  CityModel(name: 'Prague'),
  CityModel(name: 'Budapest'),
  CityModel(name: 'Warsaw'),
  CityModel(name: 'Vienna'),
  CityModel(name: 'Zurich'),
  CityModel(name: 'Hamburg'),
  CityModel(name: 'Copenhagen'),
  CityModel(name: 'Stockholm'),
  CityModel(name: 'Oslo'),
  CityModel(name: 'Amsterdam'),
  CityModel(name: 'Athens'),
  CityModel(name: 'Reykjavik'),
  CityModel(name: 'Dublin'),
  CityModel(name: 'Edinburgh'),
  CityModel(name: 'Belfast'),
  CityModel(name: 'Cardiff'),
  CityModel(name: 'Birmingham'),
  CityModel(name: 'Glasgow'),
  CityModel(name: 'Leeds'),
  CityModel(name: 'Liverpool'),
  CityModel(name: 'Manchester'),
  CityModel(name: 'Sheffield'),
  CityModel(name: 'Lisbon'),
  CityModel(name: 'Cork'),
  CityModel(name: 'Dubrovnik'),
  CityModel(name: 'Split'),
  CityModel(name: 'Zagreb'),
  CityModel(name: 'Bucharest'),
  CityModel(name: 'Budapest'),
  CityModel(name: 'Belgrade'),
  CityModel(name: 'Bratislava'),
  CityModel(name: 'Ljubljana'),
  CityModel(name: 'Luxembourg'),
  CityModel(name: 'Brussels'),
  CityModel(name: 'Dhaka'),
  CityModel(name: 'Djibouti'),
  CityModel(name: 'Dodoma'),
  CityModel(name: 'Doha'),
  CityModel(name: 'Douglas'),
  CityModel(name: 'Dubai'),
];
