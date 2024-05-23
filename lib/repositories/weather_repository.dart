import 'package:open_weather_bloc/exceptions/weather_exception.dart';
import 'package:open_weather_bloc/models/custom_error.dart';
import 'package:open_weather_bloc/models/weather.dart';
import 'package:open_weather_bloc/services/open_weather.dart';

class WeatherRepository {
  final OpenWeatherService weatherService;

  WeatherRepository({required this.weatherService});

  Future<Weather> fetchWeather(String city) async {
    try {
      final location = await weatherService.getLocation(city);
      final weather = await weatherService.getWeather(location);
      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errorMsg: e.message);
    } catch (e) {
      throw CustomError(errorMsg: e.toString());
    }
  }
}
