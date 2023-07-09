import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubit/cubit_wether.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search a cittttty"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) async {
                cityName = value;

                BlocProvider.of<WeatherCubit>(context)
                    .getWatherr(nameCity: cityName!);
                BlocProvider.of<WeatherCubit>(context).nameCity = cityName;

                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 25),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: " Enter a city",
                  label: const Text("  search")),
            ),
          ),
        ));
  }
}
