import 'package:fly_cargo/features/create_order/domain/enitites/create_order_entity.dart';

class FieldValidationResult {
  final String field;
  final String? error;

  const FieldValidationResult(this.field, this.error);

  bool get isValid => error == null;
  bool get hasError => error != null;
}

/// Базовый класс для валидатора поля
abstract class FieldValidator<T> {
  final String fieldName;

  const FieldValidator(this.fieldName);

  /// Получить значение поля из entity
  T getValue(CreateOrderEntity entity);

  /// Валидировать значение
  String? validate(T value);

  FieldValidationResult call(CreateOrderEntity entity) {
    final value = getValue(entity);
    final error = validate(value);
    return FieldValidationResult(fieldName, error);
  }
}
