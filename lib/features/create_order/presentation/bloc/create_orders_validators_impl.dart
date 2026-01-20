import 'package:fly_cargo/features/create_order/domain/enitites/create_order_entity.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_validators.dart';

class DescriptionValidator extends FieldValidator<String> {
  const DescriptionValidator() : super('description');

  @override
  String getValue(CreateOrderEntity entity) => entity.description;

  @override
  String? validate(String value) {
    if (value.isEmpty) {
      return 'Введите описание заказа';
    }
    if (value.length < 5) {
      return 'Описание должно содержать минимум 5 символов';
    }
    if (value.length > 100) {
      return 'Описание слишком длинное (максимум 100 символов)';
    }
    return null;
  }
}

class WeightValidator extends FieldValidator<double> {
  const WeightValidator() : super('weight');

  @override
  double getValue(CreateOrderEntity entity) => entity.weight;

  @override
  String? validate(double value) {
    if (value <= 0) {
      return 'Укажите вес посылки';
    }
    if (value > 100) {
      return 'Максимальный вес 100 кг';
    }
    return null;
  }
}

class TariffValidator extends FieldValidator<int> {
  const TariffValidator() : super('tariffId');

  @override
  int getValue(CreateOrderEntity entity) => entity.tariffId;

  @override
  String? validate(int value) {
    if (value <= 0) {
      return 'Выберите тариф доставки';
    }
    return null;
  }
}

class FromCityValidator extends FieldValidator<int> {
  const FromCityValidator() : super('fromCityId');

  @override
  int getValue(CreateOrderEntity entity) => entity.fromCityId;

  @override
  String? validate(int value) {
    if (value <= 0) {
      return 'Выберите город отправления';
    }
    return null;
  }
}

class FromAddressValidator extends FieldValidator<String> {
  const FromAddressValidator() : super('fromAddress');

  @override
  String getValue(CreateOrderEntity entity) => entity.fromAddress;

  @override
  String? validate(String value) {
    if (value.isEmpty) {
      return 'Введите адрес отправления';
    }
    if (value.length < 2) {
      return 'Адрес слишком короткий';
    }
    return null;
  }
}

class ToCityValidator extends FieldValidator<int> {
  const ToCityValidator() : super('toCityId');

  @override
  int getValue(CreateOrderEntity entity) => entity.toCityId;

  @override
  String? validate(int value) {
    if (value <= 0) {
      return 'Выберите город назначения';
    }
    return null;
  }
}

class ToAddressValidator extends FieldValidator<String> {
  const ToAddressValidator() : super('toAddress');

  @override
  String getValue(CreateOrderEntity entity) => entity.toAddress;

  @override
  String? validate(String value) {
    if (value.isEmpty) {
      return 'Введите адрес доставки';
    }
    if (value.length < 2) {
      return 'Адрес слишком короткий';
    }
    return null;
  }
}

class RecipientNameValidator extends FieldValidator<String> {
  const RecipientNameValidator() : super('toName');

  @override
  String getValue(CreateOrderEntity entity) => entity.toName;

  @override
  String? validate(String value) {
    if (value.isEmpty) {
      return 'Введите имя получателя';
    }
    if (value.length < 2) {
      return 'Имя слишком короткое';
    }

    if (!RegExp(r'[а-яА-ЯёЁa-zA-Z]').hasMatch(value)) {
      return 'Имя должно содержать буквы';
    }
    return null;
  }
}

class RecipientPhoneValidator extends FieldValidator<String> {
  const RecipientPhoneValidator() : super('toPhone');

  @override
  String getValue(CreateOrderEntity entity) => entity.toPhone;

  @override
  String? validate(String value) {
    if (value.isEmpty) {
      return 'Введите номер телефона получателя';
    }

    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 10) {
      return 'Неполный номер телефона';
    }

    if (digitsOnly.length > 11) {
      return 'Номер телефона слишком длинный';
    }

    // Проверка на валидный формат (начинается с 7 или 8 для России)
    if (digitsOnly.length == 11 &&
        !digitsOnly.startsWith('7') &&
        !digitsOnly.startsWith('8')) {
      return 'Номер должен начинаться с 7 или 8';
    }

    return null;
  }
}

class CreateOrderValidator {
  final List<FieldValidator> validators;

  const CreateOrderValidator({
    required this.validators,
  });

  factory CreateOrderValidator.standard() {
    return const CreateOrderValidator(
      validators: [
        PhotosValidator(),
        DescriptionValidator(),
        WeightValidator(),
        TariffValidator(),
        FromCityValidator(),
        FromAddressValidator(),
        ToCityValidator(),
        ToAddressValidator(),
        RecipientNameValidator(),
        RecipientPhoneValidator(),
      ],
    );
  }

  Map<String, String> validate(CreateOrderEntity entity) {
    final errors = <String, String>{};

    for (final validator in validators) {
      final result = validator(entity);
      if (result.hasError) {
        errors[result.field] = result.error!;
      }
    }

    return errors;
  }

  String? validateField(String fieldName, CreateOrderEntity entity) {
    final validator = validators.firstWhere(
      (v) => v.fieldName == fieldName,
      orElse: () =>
          throw ArgumentError('Validator for field "$fieldName" not found'),
    );

    final result = validator(entity);
    return result.error;
  }

  /// Проверить, валидна ли вся форма
  bool isValid(CreateOrderEntity entity) {
    return validate(entity).isEmpty;
  }

  /// Получить первую ошибку (для показа в общем сообщении)
  String? getFirstError(CreateOrderEntity entity) {
    for (final validator in validators) {
      final result = validator(entity);
      if (result.hasError) {
        return result.error;
      }
    }
    return null;
  }
}

class PhotosValidator extends FieldValidator<List<String>> {
  const PhotosValidator() : super('photos');

  @override
  List<String> getValue(CreateOrderEntity entity) => entity.photos;

  @override
  String? validate(List<String> value) {
    if (value.length < 5) {
      return 'Загрузите фотографии';
    }
    return null;
  }
}
