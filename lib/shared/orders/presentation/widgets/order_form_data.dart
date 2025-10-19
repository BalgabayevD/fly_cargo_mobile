class OrderFormData {
  final bool isDefect;
  final bool isFragile;
  final String category;
  final String comment;
  final String description;
  final String fromApartment;
  final String fromEntrance;
  final String fromFloor;
  final String toApartment;
  final String toEntrance;
  final String toFloor;

  const OrderFormData({
    required this.isDefect,
    required this.isFragile,
    required this.category,
    required this.comment,
    required this.description,
    required this.fromApartment,
    required this.fromEntrance,
    required this.fromFloor,
    required this.toApartment,
    required this.toEntrance,
    required this.toFloor,
  });
}
