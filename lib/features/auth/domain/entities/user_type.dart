enum UserType {
  unauthorized('unauthorized'),
  user('user'),
  courier('courier'),
  admin('admin');

  final String value;
  const UserType(this.value);
}

extension UserTypeExtension on UserType {
  String get displayName {
    switch (this) {
      case UserType.unauthorized:
        return 'Неавторизован';
      case UserType.user:
        return 'Пользователь';
      case UserType.courier:
        return 'Курьер';
      case UserType.admin:
        return 'Администратор';
    }
  }

  String get apiValue {
    switch (this) {
      case UserType.unauthorized:
        return 'unauthorized';
      case UserType.user:
        return 'user';
      case UserType.courier:
        return 'courier';
      case UserType.admin:
        return 'admin';
    }
  }

  bool get isAuthenticated => this != UserType.unauthorized;
  bool get isUser => this == UserType.user;
  bool get isCourier => this == UserType.courier;
  bool get isAdmin => this == UserType.admin;
}
