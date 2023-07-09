import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:weather_app/Screens/search.dart';
import 'package:weather_app/cubit/cubit_states.dart';
import 'package:weather_app/cubit/cubit_wether.dart';
import 'package:weather_app/models/weather_modal.dart';



class HomePage extends StatelessWidget {
  HomePage({super.key});
  WeatherModel? weatherModel;
  String? nameCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return SearchPage();
                  }));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is InitialStates) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              );
            } else if (state is LoadingDataStates) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SuccessDataStates) {
              weatherModel =
                  BlocProvider.of<WeatherCubit>(context).weatherModell;
              nameCity = BlocProvider.of<WeatherCubit>(context).nameCity;
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [weatherModel!.getColorTheme(), Colors.orange],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                     BlocProvider.of<WeatherCubit>(context).nameCity!,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(BlocProvider.of<WeatherCubit>(
                      context,
                    ).weatherModell!.date!.toString()),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherModel!.getImage()),
                        const Text(
                          "30",
                          style: TextStyle(fontSize: 25),
                        ),
                        Column(
                          children: [
                            Text(
                                "maxTemp : ${BlocProvider.of<WeatherCubit>(context, listen: true).weatherModell!.maxTemp!.toInt()}"),
                            Text(
                                "minTemp : ${BlocProvider.of<WeatherCubit>(context, listen: true).weatherModell!.minTemp!.toInt()}"),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      BlocProvider.of<WeatherCubit>(
                        context,
                      ).weatherModell!.weatherStateName!,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                  child: const Text("some thing wrong please try again"));
            }
          },
        ));
  }
}
