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

  Weather({
    required this.name,
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.country,
    lastUpdated,
  }) : lastUpdated = lastUpdated ?? DateTime.now();

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

  @override
  List<Object?> get props {
    return [
      name,
      description,
      icon,
      temp,
      tempMin,
      tempMax,
      country,
      lastUpdated,
    ];
  }
}
