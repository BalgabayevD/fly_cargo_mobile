import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
class AppTypography {
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
  static const TextStyle h1 = TextStyle(
    fontSize: fontSize32,
    fontWeight: fontWeightBold,
    color: AppColors.textPrimary,
    height: lineHeightTight,
  );
  static const TextStyle h2 = TextStyle(
    fontSize: fontSize28,
    fontWeight: fontWeightBold,
    color: AppColors.textPrimary,
    height: lineHeightTight,
  );
  static const TextStyle h3 = TextStyle(
    fontSize: fontSize24,
    fontWeight: fontWeightSemiBold,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  static const TextStyle h4 = TextStyle(
    fontSize: fontSize20,
    fontWeight: fontWeightSemiBold,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  static const TextStyle h5 = TextStyle(
    fontSize: fontSize18,
    fontWeight: fontWeightSemiBold,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  static const TextStyle h6 = TextStyle(
    fontSize: fontSize16,
    fontWeight: fontWeightSemiBold,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontSize: fontSize16,
    fontWeight: fontWeightRegular,
    color: AppColors.textPrimary,
    height: lineHeightRelaxed,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: fontSize14,
    fontWeight: fontWeightRegular,
    color: AppColors.textPrimary,
    height: lineHeightRelaxed,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: fontSize12,
    fontWeight: fontWeightRegular,
    color: AppColors.textSecondary,
    height: lineHeightNormal,
  );
  static const TextStyle cardTitle = TextStyle(
    fontSize: fontSize16,
    fontWeight: fontWeightSemiBold,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  static const TextStyle sectionTitle = TextStyle(
    fontSize: fontSize18,
    fontWeight: fontWeightSemiBold,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  static const TextStyle subtitleLarge = TextStyle(
    fontSize: fontSize16,
    fontWeight: fontWeightMedium,
    color: AppColors.textSecondary,
    height: lineHeightNormal,
  );
  static const TextStyle subtitleMedium = TextStyle(
    fontSize: fontSize14,
    fontWeight: fontWeightMedium,
    color: AppColors.textSecondary,
    height: lineHeightNormal,
  );
  static const TextStyle subtitleSmall = TextStyle(
    fontSize: fontSize12,
    fontWeight: fontWeightMedium,
    color: AppColors.textSecondary,
    height: lineHeightNormal,
  );
  static const TextStyle buttonLarge = TextStyle(
    fontSize: fontSize16,
    fontWeight: fontWeightSemiBold,
    color: AppColors.white,
    height: lineHeightNormal,
  );
  static const TextStyle buttonMedium = TextStyle(
    fontSize: fontSize14,
    fontWeight: fontWeightSemiBold,
    color: AppColors.white,
    height: lineHeightNormal,
  );
  static const TextStyle buttonSmall = TextStyle(
    fontSize: fontSize12,
    fontWeight: fontWeightSemiBold,
    color: AppColors.white,
    height: lineHeightNormal,
  );
  static const TextStyle linkLarge = TextStyle(
    fontSize: fontSize16,
    fontWeight: fontWeightMedium,
    color: AppColors.primary,
    height: lineHeightNormal,
    decoration: TextDecoration.underline,
  );
  static const TextStyle linkMedium = TextStyle(
    fontSize: fontSize14,
    fontWeight: fontWeightMedium,
    color: AppColors.primary,
    height: lineHeightNormal,
    decoration: TextDecoration.underline,
  );
  static const TextStyle linkSmall = TextStyle(
    fontSize: fontSize12,
    fontWeight: fontWeightMedium,
    color: AppColors.primary,
    height: lineHeightNormal,
    decoration: TextDecoration.underline,
  );
  static const TextStyle caption = TextStyle(
    fontSize: fontSize12,
    fontWeight: fontWeightRegular,
    color: AppColors.textTertiary,
    height: lineHeightNormal,
  );
  static const TextStyle overline = TextStyle(
    fontSize: fontSize10,
    fontWeight: fontWeightMedium,
    color: AppColors.textTertiary,
    height: lineHeightNormal,
    letterSpacing: 1.5,
  );
  static const TextStyle priceLarge = TextStyle(
    fontSize: fontSize24,
    fontWeight: fontWeightBold,
    color: AppColors.primary,
    height: lineHeightTight,
  );
  static const TextStyle priceMedium = TextStyle(
    fontSize: fontSize20,
    fontWeight: fontWeightSemiBold,
    color: AppColors.primary,
    height: lineHeightTight,
  );
  static const TextStyle priceSmall = TextStyle(
    fontSize: fontSize16,
    fontWeight: fontWeightSemiBold,
    color: AppColors.primary,
    height: lineHeightTight,
  );
  static const TextStyle success = TextStyle(
    fontSize: fontSize14,
    fontWeight: fontWeightMedium,
    color: AppColors.success,
    height: lineHeightNormal,
  );
  static const TextStyle warning = TextStyle(
    fontSize: fontSize14,
    fontWeight: fontWeightMedium,
    color: AppColors.warning,
    height: lineHeightNormal,
  );
  static const TextStyle error = TextStyle(
    fontSize: fontSize14,
    fontWeight: fontWeightMedium,
    color: AppColors.error,
    height: lineHeightNormal,
  );
  static const TextStyle info = TextStyle(
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
