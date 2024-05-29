import 'package:open_weather_bloc/core/utils/typedef.dart';

import '../../../core/usecase/usecase.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeatherUseCase implements UseCase<Weather, String> {
  WeatherRepository repository;

  GetWeatherUseCase({
    required this.repository,
  });

  @override
  ResultFuture<Weather> call({required String params}) {
    return repository.getWeatherByCity(params);
  }
}
