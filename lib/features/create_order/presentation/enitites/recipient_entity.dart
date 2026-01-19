import 'package:equatable/equatable.dart';

class RecipientEntity extends Equatable {
  final String name;
  final String phone;

  const RecipientEntity({
    this.name = '',
    this.phone = '',
  });

  @override
  List<Object?> get props => [name, phone];

  RecipientEntity copyWith({
    String? name,
    String? phone,
  }) {
    return RecipientEntity(
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  String get listTileLabel {
    return '$name, $phone';
  }
}
