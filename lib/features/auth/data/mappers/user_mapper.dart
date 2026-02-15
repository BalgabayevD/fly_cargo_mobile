import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_entity.dart'
    as entity;

class UserMapper {
  static entity.UserEntity toEntity(UserModel model) {
    return entity.UserEntity(
      id: model.id,
      emailVerified: model.emailVerified,
      createdAt: DateTime.parse(model.createdAt),
      updatedAt: DateTime.parse(model.updatedAt),
      phoneNumberVerified: model.phoneNumberVerified,
      role: _mapRoleToEntity(model.role),
      banned: model.banned,
      name: model.name,
      email: model.email,
      image: model.image,
      phoneNumber: model.phoneNumber,
      banReason: model.banReason,
      banExpires: (model.banExpires != null && model.banExpires!.isNotEmpty)
          ? DateTime.parse(model.banExpires!)
          : null,
      lang: model.lang,
      firstName: model.firstName,
      lastName: model.lastName,
      middleName: model.middleName,
      birthDay: (model.birthDay != null && model.birthDay!.isNotEmpty)
          ? DateTime.parse(model.birthDay!)
          : null,
      city: model.city,
      type: model.type,
      iin: model.iin,
      bin: model.bin,
    );
  }

  static UserModel toModel(entity.UserEntity entityData) {
    return UserModel(
      id: entityData.id,
      name: entityData.name,
      email: entityData.email,
      emailVerified: entityData.emailVerified,
      image: entityData.image,
      createdAt: entityData.createdAt.toIso8601String(),
      updatedAt: entityData.updatedAt.toIso8601String(),
      phoneNumber: entityData.phoneNumber,
      phoneNumberVerified: entityData.phoneNumberVerified,
      role: _mapRoleToModel(entityData.role),
      banned: entityData.banned,
      banReason: entityData.banReason,
      banExpires: entityData.banExpires?.toIso8601String(),
      lang: entityData.lang,
      firstName: entityData.firstName,
      lastName: entityData.lastName,
      middleName: entityData.middleName,
      birthDay: entityData.birthDay?.toIso8601String(),
      city: entityData.city,
      type: entityData.type,
      iin: entityData.iin,
      bin: entityData.bin,
    );
  }

  static entity.UserRole _mapRoleToEntity(UserRole modelRole) {
    switch (modelRole) {
      case UserRole.admin:
        return entity.UserRole.admin;
      case UserRole.courier:
        return entity.UserRole.courier;
      case UserRole.operator:
        return entity.UserRole.operator;
      case UserRole.user:
        return entity.UserRole.user;
    }
  }

  static UserRole _mapRoleToModel(entity.UserRole entityRole) {
    switch (entityRole) {
      case entity.UserRole.admin:
        return UserRole.admin;
      case entity.UserRole.courier:
        return UserRole.courier;
      case entity.UserRole.operator:
        return UserRole.operator;
      case entity.UserRole.user:
        return UserRole.user;
    }
  }
}
