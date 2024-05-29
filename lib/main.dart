import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_weather_bloc/core/services/injection.dart';
import 'package:open_weather_bloc/weather/presentation/cubits/settings/settings_cubit.dart';
import 'package:open_weather_bloc/weather/presentation/cubits/theme/theme_cubit.dart';
import 'package:open_weather_bloc/weather/presentation/cubits/weather/weather_cubit.dart';
import 'package:open_weather_bloc/weather/presentation/pages/home_page.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SettingsCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<WeatherCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ThemeCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return MaterialApp(
            title: 'Weather app',
            debugShowCheckedModeBanner: false,
            theme: state.appTheme == AppTheme.light
                ? ThemeData.light(useMaterial3: true)
                : ThemeData.dark(useMaterial3: true),
            home: const HomePage());
      }),
    );
  }
}
