import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_weather_bloc/cubits/weather/weather_cubit.dart';
import 'package:open_weather_bloc/pages/home_page.dart';
import 'package:open_weather_bloc/repositories/weather_repository.dart';
import 'package:open_weather_bloc/services/open_weather.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        return WeatherRepository(
          weatherService: OpenWeatherService(
            httpClient: http.Client(),
          ),
        );
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherCubit(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          )
        ],
        child: MaterialApp(
            title: 'Weather app',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomePage()),
      ),
    );
  }
}