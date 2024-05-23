import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather_bloc/models/custom_error.dart';
import 'package:open_weather_bloc/models/weather.dart';
import 'package:open_weather_bloc/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit({required this.weatherRepository})
      : super(WeatherState.inital());

  void fetchWeather(String city) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      final weather = await weatherRepository.fetchWeather(city);
      emit(state.copyWith(
        weather: weather,
        status: WeatherStatus.loaded,
      ));
      print(state);
    } on CustomError catch (e) {
      emit(
        state.copyWith(status: WeatherStatus.error, error: e),
      );
      print(state);
    }
  }
}
