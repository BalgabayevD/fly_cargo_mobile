class BoxEntity {
  final String id;
  final String name;
  final String dimensions;
  final String description;
  final String imagePath;
  final double basePrice;
  final String currency;
  const BoxEntity({
    required this.id,
    required this.name,
    required this.dimensions,
    required this.description,
    required this.imagePath,
    required this.basePrice,
    required this.currency,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BoxEntity &&
        other.id == id &&
        other.name == name &&
        other.dimensions == dimensions &&
        other.description == description &&
        other.imagePath == imagePath &&
        other.basePrice == basePrice &&
        other.currency == currency;
  }
  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        dimensions.hashCode ^
        description.hashCode ^
        imagePath.hashCode ^
        basePrice.hashCode ^
        currency.hashCode;
  }
  @override
  String toString() {
    return 'BoxEntity(id: $id, name: $name, dimensions: $dimensions, basePrice: $basePrice)';
  }
}
