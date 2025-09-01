import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String? avatar;
  final DateTime createdAt;
  final bool isVerified;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    this.avatar,
    required this.createdAt,
    required this.isVerified,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    phone,
    avatar,
    createdAt,
    isVerified,
  ];
}
