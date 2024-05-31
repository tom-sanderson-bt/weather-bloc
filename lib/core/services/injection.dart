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
  // Data sources
  sl.registerLazySingleton<Client>(() => Client());
  sl.registerLazySingleton<OpenWeatherDataSource>(
      () => OpenWeatherDataSource(httpClient: sl()));

  // Repositories
  sl.registerLazySingleton<WeatherRepository>(
      () => OpenWeatherRepository(openWeatherDataSource: sl()));

  // Use cases
  sl.registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCase(repository: sl()));
  sl.registerLazySingleton<UpdateThemeOnWeatherUseCase>(
      () => UpdateThemeOnWeatherUseCase(themeCubit: sl(), weatherCubit: sl()));

  // Cubits
  sl.registerLazySingleton<WeatherCubit>(
      () => WeatherCubit(getWeatherUseCase: sl()));
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  sl.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
}
