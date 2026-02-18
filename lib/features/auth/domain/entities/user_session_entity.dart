import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_entity.dart';

class UserSessionEntity extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime expiresAt;
  final String token;
  final String ipAddress;
  final String userId;

  const UserSessionEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
    required this.token,
    required this.ipAddress,
    required this.userId,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        expiresAt,
        token,
        ipAddress,
        userId,
      ];
}

class UserSessionInfoEntity extends Equatable {
  final UserSessionEntity session;
  final UserEntity user;
  final String? accessToken;

  const UserSessionInfoEntity({
    required this.session,
    required this.user,
    this.accessToken,
  });

  UserSessionInfoEntity copyWith({
    UserSessionEntity? session,
    UserEntity? user,
    String? accessToken,
  }) {
    return UserSessionInfoEntity(
      session: session ?? this.session,
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  @override
  List<Object?> get props => [session, user, accessToken];
}
