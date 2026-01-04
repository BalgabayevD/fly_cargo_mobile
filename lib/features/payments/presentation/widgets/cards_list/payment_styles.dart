import 'package:flutter/material.dart';

/// Extension для стилей платежных виджетов
extension PaymentStyles on BuildContext {
  /// Основной цвет кнопок оплаты
  Color get paymentPrimaryColor => const Color(0xFF5C3A31);
  
  /// Радиус скругления карточек
  double get cardBorderRadius => 12.0;
  
  /// Стиль текста заголовка карты
  TextStyle get cardTitleStyle => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  
  /// Стиль текста подзаголовка карты
  TextStyle get cardSubtitleStyle => const TextStyle(
    fontSize: 14,
  );
  
  /// Стиль текста кнопки
  TextStyle get buttonTextStyle => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}

