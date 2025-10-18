import 'package:flutter/material.dart';

class AppColors {
  // Основные цвета
  static const Color primary = Color(0xFF007AFF);
  static const Color primaryLight = Color(0xFF4DA6FF);
  static const Color primaryDark = Color(0xFF0056CC);

  // Вторичные цвета
  static const Color secondary = Color(0xFF34C759);
  static const Color secondaryLight = Color(0xFF5DD979);
  static const Color secondaryDark = Color(0xFF2AA54A);

  // Нейтральные цвета
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray50 = Color(0xFFF8F9FA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray400 = Color(0xFFD0CFCE);
  static const Color gray500 = Color(0xFF999999);
  static const Color gray600 = Color(0xFF666666);
  static const Color gray700 = Color(0xFF333333);
  static const Color gray800 = Color(0xFF1A1A1A);
  static const Color gray900 = Color(0xFF0D0D0D);

  // Семантические цвета
  static const Color success = Color(0xFF34C759);
  static const Color warning = Color(0xFFFF9500);
  static const Color error = Color(0xFFFF3B30);
  static const Color info = Color(0xFF007AFF);

  // Фоновые цвета
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8F9FA);
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // Цвета для текста
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textTertiary = Color(0xFF999999);
  static const Color textDisabled = Color(0xFFD0CFCE);

  // Цвета для границ
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderLight = Color(0xFFE9ECEF);
  static const Color borderDark = Color(0xFFD0CFCE);

  // Цвета для теней
  static const Color shadow = Color(0x1A000000);
  static const Color shadowLight = Color(0x0D000000);
  static const Color shadowDark = Color(0x26000000);

  // Прозрачный цвет
  static const Color transparent = Color(0x00000000);

  // Цвета для состояний
  static const Color selected = Color(0xFF007AFF);
  static const Color hover = Color(0xFF4DA6FF);
  static const Color pressed = Color(0xFF0056CC);
  static const Color disabled = Color(0xFFD0CFCE);

  // Цвета для иконок
  static const Color iconPrimary = Color(0xFF333333);
  static const Color iconSecondary = Color(0xFF666666);
  static const Color iconTertiary = Color(0xFF999999);
  static const Color iconDisabled = Color(0xFFD0CFCE);

  // Цвета для акцентов
  static const Color accentBlue = Color(0xFF007AFF);
  static const Color accentGreen = Color(0xFF34C759);
  static const Color accentOrange = Color(0xFFFF9500);
  static const Color accentRed = Color(0xFFFF3B30);
  static const Color accentPurple = Color(0xFFAF52DE);
  static const Color accentYellow = Color(0xFFFFCC00);

  // Градиенты
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Методы для получения цветов с прозрачностью
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }

  static Color primaryWithOpacity(double opacity) {
    return primary.withValues(alpha: opacity);
  }

  static Color secondaryWithOpacity(double opacity) {
    return secondary.withValues(alpha: opacity);
  }
}
