import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;

  const WeatherModel({
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  factory WeatherModel.initial() {
    return const WeatherModel(
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

  factory WeatherModel.fromJson(dynamic json) {
    final weather = json['weather'][0];
    final main = json['main'];
    return WeatherModel(
      description: weather['description'] ?? '',
      icon: weather['icon'] ?? '',
      temp: main['temp']?.toDouble() ?? 0.0,
      tempMin: main['temp_min']?.toDouble() ?? 0.0,
      tempMax: main['temp_max']?.toDouble() ?? 0.0,
    );
  }

  WeatherModel copyWith({
    String? name,
    String? description,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    String? country,
    DateTime? lastUpdated,
  }) {
    return WeatherModel(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
    );
  }
}
