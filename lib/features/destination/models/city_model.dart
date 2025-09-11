class CityModel {
  final String id;
  final String name;
  final String? region;

  const CityModel({
    required this.id,
    required this.name,
    this.region,
  });

  String get displayName {
    if (region != null) {
      return '$name, $region';
    }
    return name;
  }

  CityModel copyWith({
    String? id,
    String? name,
    String? region,
  }) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      region: region ?? this.region,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CityModel &&
        other.id == id &&
        other.name == name &&
        other.region == region;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ region.hashCode;

  @override
  String toString() {
    return 'CityModel(id: $id, name: $name, region: $region)';
  }
}
