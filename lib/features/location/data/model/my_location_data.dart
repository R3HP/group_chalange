import 'dart:convert';

class MyLocationData {
  final String latitude;
  final String longitude;
  final String? name;
  
  MyLocationData({
    required this.latitude,
    required this.longitude,
    this.name,
  });

  MyLocationData copyWith({
    String? latitude,
    String? longitude,
    String? name,
  }) {
    return MyLocationData(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'name': name,
    };
  }

  factory MyLocationData.fromMap(Map<String, dynamic> map) {
    return MyLocationData(
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MyLocationData.fromJson(String source) => MyLocationData.fromMap(json.decode(source));

  @override
  String toString() => 'MyLocationData(latitude: $latitude, longitude: $longitude, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MyLocationData &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.name == name;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ name.hashCode;
}
