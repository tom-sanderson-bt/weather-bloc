import 'package:dartz/dartz.dart';
import 'package:open_weather_bloc/core/errors/failure.dart';
import 'package:open_weather_bloc/core/exceptions/weather_exception.dart';
import 'package:open_weather_bloc/core/utils/typedef.dart';
import 'package:open_weather_bloc/weather/data/datasources/open_weather.dart';
import 'package:open_weather_bloc/weather/domain/entities/weather.dart';
import 'package:open_weather_bloc/weather/domain/repositories/weather_repository.dart';

class OpenWeatherRepository implements WeatherRepository {
  final OpenWeatherDataSource openWeatherDataSource;

  OpenWeatherRepository({required this.openWeatherDataSource});

  @override
  ResultFuture<Weather> getWeatherByCity(String city) async {
    try {
      final location = await openWeatherDataSource.getLocation(city);
      final weather = await openWeatherDataSource.getWeather(location);

      return Right(Weather(
        name: location.name,
        description: weather.description,
        icon: weather.icon,
        temp: weather.temp,
        tempMin: weather.tempMin,
        tempMax: weather.tempMax,
        country: location.country,
      ));
    } on WeatherException catch (e) {
      return Left(ApiFailure(message: e.message));
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
