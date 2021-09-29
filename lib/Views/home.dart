import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_riverpod/Providers/city_provider.dart';
import 'package:weather_riverpod/Providers/weather_provider.dart';
import 'package:weather_riverpod/Views/search.dart';
import 'package:weather_riverpod/models/Weather%20Model/weather_current.dart';

class Home extends StatelessWidget {
  static const String routeName = '/';
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RiverPod Weather'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, Search.routeName);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer(
                builder: (context, watch, child) {
                  final weather = watch(currentWeatherProvider);
                  return weather.when(
                    data: (data) => data == null
                        ? const Center(
                            child: Text("No location is found with that name!"),
                          )
                        : WeatherDataWidget(weather: data),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Text(stackTrace.toString()),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 100, child: Center(child: GetCityWidget())),
          ],
        ));
  }
}

class WeatherDataWidget extends StatelessWidget {
  final WeatherCurrent weather;
  const WeatherDataWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              weather.location!.name!,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(" [${weather.location!.lat!}, ${weather.location!.lon!}]",
                style: Theme.of(context).textTheme.caption),
            const SizedBox(height: 8),
            Text(
              weather.location!.country!,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: 16),
            Text(
              weather.location!.localtime!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16),
            Image.network("https:${weather.current!.condition!.icon!}"),
            Text.rich(
              TextSpan(
                text: weather.current!.tempC!.toString(),
                children: const [
                  TextSpan(text: "°C", style: TextStyle(fontSize: 32)),
                ],
              ),
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 16),
            Text("Feels Like: ${weather.current!.feelslikeC}°C",
                style: Theme.of(context).textTheme.button),
          ],
        ),
      ),
    );
  }
}

class GetCityWidget extends StatelessWidget {
  const GetCityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: const Icon(Icons.location_city),
        label: const Text("Cities"),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Consumer(
                builder: (context, watch, child) {
                  final allCity = watch(allCityProvider);

                  return ListView(
                    children: allCity.map((e) {
                      return ListTile(
                        title: Text(e.name),
                        onTap: () {
                          context.read(cityStateProvider).state = e;
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
                  );
                },
              );
            },
          );
        });
  }
}
