
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/cubit_states.dart';
import 'package:weather_app/models/weather_modal.dart';

import 'package:weather_app/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.wether ,}) : super(InitialStates());
  WeatherServices wether;
  WeatherModel? weatherModell;
  String? nameCity;
  void getWatherr({required String nameCity}) async {
    emit(LoadingDataStates());
    try {
      weatherModell = await wether.getWeather(nameCity: nameCity);
      emit(SuccessDataStates());
    } catch (e) {
      emit(FaliuerDataStates());
    }
  }
}
