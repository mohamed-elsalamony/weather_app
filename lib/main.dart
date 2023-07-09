import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/cubit_wether.dart';


import 'package:weather_app/services/weather_services.dart';

import 'Screens/home_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(wether:WeatherServices() );
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModell == null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context)
                .weatherModell!
                .getColorTheme(),
      ),
      home: HomePage(),
    );
  }
}
