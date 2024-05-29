import 'package:open_weather_bloc/core/utils/typedef.dart';

import '../entities/weather.dart';

abstract class WeatherRepository {
  ResultFuture<Weather> getWeatherByCity(String city);
}
