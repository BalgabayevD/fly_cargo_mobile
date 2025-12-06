enum UserType {
  unauthorized('unauthorized'),
  client('client'),
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
      case UserType.client:
        return 'Клиент';
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
      case UserType.client:
        return 'client';
      case UserType.courier:
        return 'courier';
      case UserType.admin:
        return 'admin';
    }
  }

  bool get isAuthenticated => this != UserType.unauthorized;
  bool get isClient => this == UserType.client;
  bool get isCourier => this == UserType.courier;
  bool get isAdmin => this == UserType.admin;
}
