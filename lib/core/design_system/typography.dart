import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fly_cargo/core/design_system/colors.dart';

class AppTypography {
  /// Базовое семейство шрифтов Montserrat
  static String get fontFamily => 'Montserrat';

  /// Получить TextStyle с Montserrat
  static TextStyle _montserrat({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }
  static const double fontSize10 = 10.0;
  static const double fontSize12 = 12.0;
  static const double fontSize14 = 14.0;
  static const double fontSize16 = 16.0;
  static const double fontSize18 = 18.0;
  static const double fontSize20 = 20.0;
  static const double fontSize24 = 24.0;
  static const double fontSize28 = 28.0;
  static const double fontSize32 = 32.0;
  static const double fontSize36 = 36.0;
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;
  static const FontWeight fontWeightExtraBold = FontWeight.w800;
  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.4;
  static const double lineHeightRelaxed = 1.5;
  static const double lineHeightLoose = 1.6;
  static TextStyle get h1 => _montserrat(
        fontSize: fontSize32,
        fontWeight: fontWeightBold,
        color: AppColors.textPrimary,
        height: lineHeightTight,
      );
  static TextStyle get h2 => _montserrat(
        fontSize: fontSize28,
        fontWeight: fontWeightBold,
        color: AppColors.textPrimary,
        height: lineHeightTight,
      );
  static TextStyle get h3 => _montserrat(
        fontSize: fontSize24,
        fontWeight: fontWeightSemiBold,
        color: AppColors.textPrimary,
        height: lineHeightNormal,
      );
  static TextStyle get h4 => _montserrat(
        fontSize: fontSize20,
        fontWeight: fontWeightSemiBold,
        color: AppColors.textPrimary,
        height: lineHeightNormal,
      );
  static TextStyle get h5 => _montserrat(
        fontSize: fontSize18,
        fontWeight: fontWeightSemiBold,
        color: AppColors.textPrimary,
        height: lineHeightNormal,
      );
  static TextStyle get h6 => _montserrat(
        fontSize: fontSize16,
        fontWeight: fontWeightSemiBold,
        color: AppColors.textPrimary,
        height: lineHeightNormal,
      );
  static TextStyle get bodyLarge => _montserrat(
        fontSize: fontSize16,
        fontWeight: fontWeightRegular,
        color: AppColors.textPrimary,
        height: lineHeightRelaxed,
      );
  static TextStyle get bodyMedium => _montserrat(
        fontSize: fontSize14,
        fontWeight: fontWeightRegular,
        color: AppColors.textPrimary,
        height: lineHeightRelaxed,
      );
  static TextStyle get bodySmall => _montserrat(
        fontSize: fontSize12,
        fontWeight: fontWeightRegular,
        color: AppColors.textSecondary,
        height: lineHeightNormal,
      );
  static TextStyle get cardTitle => _montserrat(
        fontSize: fontSize16,
        fontWeight: fontWeightSemiBold,
        color: AppColors.textPrimary,
        height: lineHeightNormal,
      );
  static TextStyle get sectionTitle => _montserrat(
        fontSize: fontSize18,
        fontWeight: fontWeightSemiBold,
        color: AppColors.textPrimary,
        height: lineHeightNormal,
      );
  static TextStyle get subtitleLarge => _montserrat(
        fontSize: fontSize16,
        fontWeight: fontWeightMedium,
        color: AppColors.textSecondary,
        height: lineHeightNormal,
      );
  static TextStyle get subtitleMedium => _montserrat(
        fontSize: fontSize14,
        fontWeight: fontWeightMedium,
        color: AppColors.textSecondary,
        height: lineHeightNormal,
      );
  static TextStyle get subtitleSmall => _montserrat(
        fontSize: fontSize12,
        fontWeight: fontWeightMedium,
        color: AppColors.textSecondary,
        height: lineHeightNormal,
      );
  static TextStyle get buttonLarge => _montserrat(
        fontSize: fontSize16,
        fontWeight: fontWeightSemiBold,
        color: AppColors.white,
        height: lineHeightNormal,
      );
  static TextStyle get buttonMedium => _montserrat(
        fontSize: fontSize14,
        fontWeight: fontWeightSemiBold,
        color: AppColors.white,
        height: lineHeightNormal,
      );
  static TextStyle get buttonSmall => _montserrat(
        fontSize: fontSize12,
        fontWeight: fontWeightSemiBold,
        color: AppColors.white,
        height: lineHeightNormal,
      );
  static TextStyle get linkLarge => _montserrat(
        fontSize: fontSize16,
        fontWeight: fontWeightMedium,
        color: AppColors.primary,
        height: lineHeightNormal,
      ).copyWith(decoration: TextDecoration.underline);
  static TextStyle get linkMedium => _montserrat(
        fontSize: fontSize14,
        fontWeight: fontWeightMedium,
        color: AppColors.primary,
        height: lineHeightNormal,
      ).copyWith(decoration: TextDecoration.underline);
  static TextStyle get linkSmall => _montserrat(
        fontSize: fontSize12,
        fontWeight: fontWeightMedium,
        color: AppColors.primary,
        height: lineHeightNormal,
      ).copyWith(decoration: TextDecoration.underline);
  static TextStyle get caption => _montserrat(
        fontSize: fontSize12,
        fontWeight: fontWeightRegular,
        color: AppColors.textTertiary,
        height: lineHeightNormal,
      );
  static TextStyle get overline => _montserrat(
        fontSize: fontSize10,
        fontWeight: fontWeightMedium,
        color: AppColors.textTertiary,
        height: lineHeightNormal,
      ).copyWith(letterSpacing: 1.5);
  static TextStyle get priceLarge => _montserrat(
        fontSize: fontSize24,
        fontWeight: fontWeightBold,
        color: AppColors.primary,
        height: lineHeightTight,
      );
  static TextStyle get priceMedium => _montserrat(
        fontSize: fontSize20,
        fontWeight: fontWeightSemiBold,
        color: AppColors.primary,
        height: lineHeightTight,
      );
  static TextStyle get priceSmall => _montserrat(
        fontSize: fontSize16,
        fontWeight: fontWeightSemiBold,
        color: AppColors.primary,
        height: lineHeightTight,
      );
  static TextStyle get success => _montserrat(
        fontSize: fontSize14,
        fontWeight: fontWeightMedium,
        color: AppColors.success,
        height: lineHeightNormal,
      );
  static TextStyle get warning => _montserrat(
        fontSize: fontSize14,
        fontWeight: fontWeightMedium,
        color: AppColors.warning,
        height: lineHeightNormal,
      );
  static TextStyle get error => _montserrat(
        fontSize: fontSize14,
        fontWeight: fontWeightMedium,
        color: AppColors.error,
        height: lineHeightNormal,
      );
  static TextStyle get info => _montserrat(
        fontSize: fontSize14,
        fontWeight: fontWeightMedium,
        color: AppColors.info,
        height: lineHeightNormal,
      );
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
}
