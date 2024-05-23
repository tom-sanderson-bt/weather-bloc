import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;

  const Weather({
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  factory Weather.initial() {
    return const Weather(
      description: '',
      icon: '',
      temp: 0,
      tempMin: 0,
      tempMax: 0,
    );
  }

  @override
  String toString() {
    return 'Weather(description: $description, icon: $icon, temp: $temp, temp_min: $tempMin, temp_max: $tempMax)';
  }

  @override
  List<Object> get props {
    return [
      description,
      icon,
      temp,
      tempMin,
      tempMax,
    ];
  }

  factory Weather.fromJson(dynamic json) {
    final weather = json['weather'][0];
    final main = json['main'];
    return Weather(
      description: weather['description'] ?? '',
      icon: weather['icon'] ?? '',
      temp: main['temp']?.toDouble() ?? 0.0,
      tempMin: main['temp_min']?.toDouble() ?? 0.0,
      tempMax: main['temp_max']?.toDouble() ?? 0.0,
    );
  }
}
