import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:open_weather_bloc/weather/data/datasources/open_weather.dart';
import 'package:open_weather_bloc/weather/data/repositories/weather_repository.dart';
import 'package:open_weather_bloc/weather/domain/repositories/weather_repository.dart';
import 'package:open_weather_bloc/weather/domain/usecases/get_weather.dart';
import 'package:open_weather_bloc/weather/domain/usecases/update_theme_on_weather.dart';
import 'package:open_weather_bloc/weather/presentation/cubits/settings/settings_cubit.dart';
import 'package:open_weather_bloc/weather/presentation/cubits/theme/theme_cubit.dart';
import 'package:open_weather_bloc/weather/presentation/cubits/weather/weather_cubit.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  sl
    ..registerLazySingleton<Client>(
      () => Client(),
    )
    ..registerLazySingleton<OpenWeatherDataSource>(
      () => OpenWeatherDataSource(httpClient: sl()),
    )
    ..registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCase(repository: sl()),
    )
    ..registerLazySingleton<WeatherCubit>(
      () => WeatherCubit(getWeatherUseCase: sl()),
    )
    ..registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(),
    )
    ..registerLazySingleton<SettingsCubit>(
      () => SettingsCubit(),
    )
    ..registerLazySingleton<UpdateThemeOnWeatherUseCase>(
      () => UpdateThemeOnWeatherUseCase(themeCubit: sl(), weatherCubit: sl()),
    )
    ..registerLazySingleton<WeatherRepository>(
      () => OpenWeatherRepository(openWeatherDataSource: sl()),
    );
}
