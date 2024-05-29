part of 'weather_cubit.dart';

enum WeatherStatus {
  initial,
  error,
  loading,
  loaded,
}

class WeatherState extends Equatable {
  final WeatherStatus status;
  final Weather weather;
  final Failure failure;

  const WeatherState({
    required this.status,
    required this.weather,
    required this.failure,
  });

  factory WeatherState.inital() {
    return WeatherState(
      status: WeatherStatus.initial,
      weather: Weather.initial(),
      failure: const ApiFailure(message: ''),
    );
  }

  @override
  List<Object> get props => [status, weather, failure];

  @override
  String toString() =>
      'WeatherState(status: $status, weather: $weather, failure: $failure)';

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    Failure? failure,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      failure: failure ?? this.failure,
    );
  }
}
