import 'package:equatable/equatable.dart';

enum UserRole {
  admin,
  courier,
  operator,
  user;

  String get value => name;
}

class UserEntity extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final bool emailVerified;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? phoneNumber;
  final bool phoneNumberVerified;
  final UserRole role;
  final bool banned;
  final String? banReason;
  final DateTime? banExpires;
  final String? lang;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final DateTime? birthDay;
  final String? city;
  final String? type;
  final String? iin;
  final String? bin;

  const UserEntity({
    required this.id,
    required this.emailVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.phoneNumberVerified,
    required this.role,
    required this.banned,
    this.name,
    this.email,
    this.image,
    this.phoneNumber,
    this.banReason,
    this.banExpires,
    this.lang,
    this.firstName,
    this.lastName,
    this.middleName,
    this.birthDay,
    this.city,
    this.type,
    this.iin,
    this.bin,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        emailVerified,
        image,
        createdAt,
        updatedAt,
        phoneNumber,
        phoneNumberVerified,
        role,
        banned,
        banReason,
        banExpires,
        lang,
        firstName,
        lastName,
        middleName,
        birthDay,
        city,
        type,
        iin,
        bin,
      ];
}
