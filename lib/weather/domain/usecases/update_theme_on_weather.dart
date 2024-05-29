import 'package:open_weather_bloc/core/constants/constants.dart';
import 'package:open_weather_bloc/weather/presentation/cubits/theme/theme_cubit.dart';
import 'package:open_weather_bloc/weather/presentation/cubits/weather/weather_cubit.dart';

import '../../../core/usecase/usecase.dart';

class UpdateThemeOnWeatherUseCase implements UseCaseListener {
  WeatherCubit weatherCubit;
  ThemeCubit themeCubit;

  UpdateThemeOnWeatherUseCase({
    required this.weatherCubit,
    required this.themeCubit,
  });

  @override
  void call() {
    weatherCubit.stream.listen((event) {
      AppTheme appTheme =
          (event.weather.temp > kWarmOrNot) ? AppTheme.light : AppTheme.dark;
      themeCubit.changeTheme(appTheme);
    });
  }
}
