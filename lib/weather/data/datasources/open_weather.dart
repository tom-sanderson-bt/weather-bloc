import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather_bloc/core/constants/constants.dart';
import 'package:open_weather_bloc/core/exceptions/weather_exception.dart';

import '../models/location.dart';
import '../models/weather.dart';

class OpenWeatherDataSource {
  final http.Client httpClient;

  OpenWeatherService({required this.httpClient});

  Future<LocationModel> getLocation(String city) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/geo/1.0/direct',
        queryParameters: {
          'q': city,
          'limit': kLimit,
          'appid': dotenv.env['OPEN_WEATHER_KEY']
        });
    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {}

      final responseBody = json.decode(response.body);

      if (responseBody.isEmpty) {
        throw WeatherException(message: 'Cannot get the location of $city');
      }
      return LocationModel.fromJson(responseBody);
    } catch (e) {
      throw WeatherException(message: e.toString());
    }
  }

  Future<WeatherModel> getWeather(LocationModel location) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/data/2.5/weather',
        queryParameters: {
          'lat': "${location.lat}",
          'lon': "${location.lon}",
          'units': kMetric,
          'appid': dotenv.env['OPEN_WEATHER_KEY']
        });

    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw WeatherException(message: "Unable to get the weather");
      }

      final responseBody = json.decode(response.body);

      return WeatherModel.fromJson(responseBody);
    } catch (e) {
      throw WeatherException(message: e.toString());
    }
  }
}
