import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather_bloc/core/errors/failure.dart';
import 'package:open_weather_bloc/weather/domain/entities/weather.dart';
import 'package:open_weather_bloc/weather/domain/usecases/get_weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  WeatherCubit({required this.getWeatherUseCase})
      : super(WeatherState.inital());

  void fetchWeather(String city) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    final weather = await getWeatherUseCase(params: city);

    weather.fold(
      (failure) =>
          emit(state.copyWith(status: WeatherStatus.error, failure: failure)),
      (weather) =>
          emit(state.copyWith(status: WeatherStatus.loaded, weather: weather)),
    );
  }
}
