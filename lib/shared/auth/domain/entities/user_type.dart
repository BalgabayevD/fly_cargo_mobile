/// Типы пользователей в системе
enum UserType {
  /// Неавторизованный пользователь
  unauthorized,

  /// Клиент (заказчик)
  client,

  /// Курьер
  courier,
}

/// Расширения для UserType
extension UserTypeExtension on UserType {
  /// Получить строковое представление типа пользователя
  String get displayName {
    switch (this) {
      case UserType.unauthorized:
        return 'Неавторизован';
      case UserType.client:
        return 'Клиент';
      case UserType.courier:
        return 'Курьер';
    }
  }

  /// Получить значение для API
  String get apiValue {
    switch (this) {
      case UserType.unauthorized:
        return 'unauthorized';
      case UserType.client:
        return 'client';
      case UserType.courier:
        return 'courier';
    }
  }

  /// Проверить, авторизован ли пользователь
  bool get isAuthenticated => this != UserType.unauthorized;

  /// Проверить, является ли пользователь клиентом
  bool get isClient => this == UserType.client;

  /// Проверить, является ли пользователь курьером
  bool get isCourier => this == UserType.courier;
}
