import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String name;
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String country;
  final DateTime? lastUpdated;

  const Weather({
    required this.name,
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.country,
    required this.lastUpdated,
  });

  factory Weather.initial() {
    return Weather(
      name: '',
      description: '',
      icon: '',
      temp: 0,
      tempMin: 0,
      tempMax: 0,
      country: '',
      lastUpdated: DateTime(1970),
    );
  }

  @override
  String toString() {
    return 'Weather(name: $name, description: $description, icon: $icon, temp: $temp, temp_min: $tempMin, temp_max: $tempMax)';
  }

  @override
  List<Object> get props {
    return [
      name,
      description,
      icon,
      temp,
      tempMin,
      tempMax,
      country,
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
      name: '',
      country: '',
      lastUpdated: DateTime.now(),
    );
  }

  Weather copyWith({
    String? name,
    String? description,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    String? country,
    DateTime? lastUpdated,
  }) {
    return Weather(
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      country: country ?? this.country,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
