import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFE47B35);
  static const Color primaryLight = Color(0xFFFF9A5C);
  static const Color primaryDark = Color(0xFFC86020);
  static const Color secondary = Color(0xFFFFE4D2);
  static const Color secondaryLight = Color(0xFFFFF3E9);
  static const Color secondaryDark = Color(0xFFFFD1B3);
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
  static const Color success = Color(0xFF34C759);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFFF3B30);
  static const Color info = Color(0xFF2196F3);
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8F9FA);
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF333333);
  static const Color cargoParagraph = Color(0xFF21201F);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textSecondaryLight = Color(0xFF8F8F8E);
  static const Color textTertiary = Color(0xFF999999);
  static const Color textDisabled = Color(0xFFD0CFCE);
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderLight = Color(0xFFE9ECEF);
  static const Color borderDark = Color(0xFFD0CFCE);
  static const Color shadow = Color(0x1A000000);
  static const Color shadowLight = Color(0x0D000000);
  static const Color shadowDark = Color(0x26000000);
  static const Color transparent = Color(0x00000000);
  static const Color selected = Color(0xFFE47B35);
  static const Color hover = Color(0xFFFF9A5C);
  static const Color pressed = Color(0xFFC86020);
  static const Color disabled = Color(0xFFD0CFCE);
  static const Color iconPrimary = Color(0xFF333333);
  static const Color iconSecondary = Color(0xFF666666);
  static const Color iconTertiary = Color(0xFF999999);
  static const Color iconDisabled = Color(0xFFD0CFCE);

  static const Color accentBlue = Color(0xFF2196F3);
  static const Color accentGreen = Color(0xFF34C759);
  static const Color accentOrange = Color(0xFFE47B35);
  static const Color accentRed = Color(0xFFFF3B30);
  static const Color accentPurple = Color(0xFFAF52DE);
  static const Color accentYellow = Color(0xFFFFC107);
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondaryDark, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient primaryDarkGradient = LinearGradient(
    colors: [primaryDark, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
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
