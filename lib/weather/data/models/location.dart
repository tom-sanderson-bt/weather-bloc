import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final String name;
  final double lat;
  final double lon;
  final String country;

  const LocationModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  @override
  String toString() {
    return 'LocationModel(name: $name, lat: $lat, lon: $lon, country: $country)';
  }

  @override
  List<Object> get props => [name, lat, lon, country];

  LocationModel copyWith({
    String? name,
    double? lat,
    double? lon,
    String? country,
  }) {
    return LocationModel(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
    );
  }

  factory LocationModel.fromJson(dynamic json) {
    final data = json[0];
    return LocationModel(
      name: data['name'] ?? '',
      lat: data['lat']?.toDouble() ?? 0.0,
      lon: data['lon']?.toDouble() ?? 0.0,
      country: data['country'] ?? '',
    );
  }
}
