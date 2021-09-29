import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/Providers/city_provider.dart';

import 'package:weather_riverpod/Providers/search_location_provider.dart';
import 'package:weather_riverpod/Providers/weather_provider.dart';
import 'package:weather_riverpod/models/City%20Model/city_model.dart';
import 'package:weather_riverpod/models/Weather%20Model/search_location.dart';

class Search extends StatelessWidget {
  static const routeName = '/search';

  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                label: Text('Search'),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                if (value.length > 2) {
                  context.read(searchLocationStateProvider).state = value;
                } else if (value.isEmpty) {
                  context.read(searchLocationStateProvider).state = '';
                }
              },
            ),
          ),
          Expanded(child: Consumer(
            builder: (context, watch, child) {
              final searchQuery = watch(searchLocationStateProvider).state;
              return searchQuery.isEmpty
                  ? const Center(
                      child: Text("Search Cities"),
                    )
                  : const SearchResultsWidget();
            },
          ))
        ],
      ),
    );
  }
}

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final results = watch(locationSearchProvider);
        return results.when(
          data: (data) => data!.isEmpty
              ? const Center(
                  child: Text("No result found!"),
                )
              : ListView(
                  children: data
                      .map((e) => SingleSearchResult(
                            result: e,
                          ))
                      .toList(),
                ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
        );
      },
    );
  }
}

class SingleSearchResult extends StatelessWidget {
  final SearchLocationResult result;
  const SingleSearchResult({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(result.name!),
        subtitle: Text(result.country!),
        onTap: () {
          Navigator.pop(context);
          context.read(cityStateProvider).state = CityModel(name: result.url!);
        });
  }
}
