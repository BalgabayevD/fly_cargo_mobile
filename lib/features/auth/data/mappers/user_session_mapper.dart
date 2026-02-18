import 'package:fly_cargo/features/auth/data/mappers/user_mapper.dart';
import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_session_entity.dart';

class UserSessionMapper {
  static UserSessionEntity toEntity(UserSessionModel model) {
    return UserSessionEntity(
      id: model.id,
      createdAt: DateTime.parse(model.createdAt),
      updatedAt: DateTime.parse(model.updatedAt),
      expiresAt: DateTime.parse(model.expiresAt),
      token: model.token,
      ipAddress: model.ipAddress,
      userId: model.userId,
    );
  }

  static UserSessionModel toModel(UserSessionEntity entity) {
    return UserSessionModel(
      id: entity.id,
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt.toIso8601String(),
      expiresAt: entity.expiresAt.toIso8601String(),
      token: entity.token,
      ipAddress: entity.ipAddress,
      userId: entity.userId,
    );
  }
}

class UserSessionInfoMapper {
  static UserSessionInfoEntity toEntity(UserSessionInfoModel model) {
    return UserSessionInfoEntity(
      session: UserSessionMapper.toEntity(model.session),
      user: UserMapper.toEntity(model.user),
      accessToken: model.accessToken,
    );
  }

  static UserSessionInfoModel toModel(UserSessionInfoEntity entity) {
    return UserSessionInfoModel(
      session: UserSessionMapper.toModel(entity.session),
      user: UserMapper.toModel(entity.user),
      accessToken: entity.accessToken,
    );
  }
}
