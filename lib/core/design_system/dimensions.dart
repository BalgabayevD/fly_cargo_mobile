import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';

class AppDimensions {
  static const double imageBoxSize = 160.0;
  static const double imageSmall = 80.0;
  static const double imageMedium = 120.0;
  static const double imageLarge = 200.0;

  static const double buttonHeightSmall = 40.0;
  static const double buttonHeightMedium = 48.0;
  static const double buttonHeightLarge = 56.0;

  static const double progressIndicatorSmall = 16.0;
  static const double progressIndicatorMedium = 24.0;
  static const double progressIndicatorLarge = 32.0;
  static const double progressStrokeWidth = 2.0;

  static const double containerSmall = 120.0;
  static const double containerMedium = 160.0;
  static const double containerLarge = 200.0;
}

class AppGradients {
  static LinearGradient get primaryGradient => LinearGradient(
    colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient get secondaryGradient => LinearGradient(
    colors: [AppColors.info, AppColors.info.withValues(alpha: 0.8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient primaryLightGradient({double opacity = 0.1}) =>
      LinearGradient(
        colors: [
          AppColors.primary.withValues(alpha: opacity),
          AppColors.primary.withValues(alpha: opacity * 0.5),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient secondaryLightGradient({double opacity = 0.1}) =>
      LinearGradient(
        colors: [
          AppColors.info.withValues(alpha: opacity),
          AppColors.info.withValues(alpha: opacity * 0.5),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}

class AppDecorations {
  static BoxDecoration cardDecoration({
    Color? color,
    double? borderRadius,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      color: color ?? AppColors.white,
      borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusXL),
      boxShadow: boxShadow,
    );
  }

  static BoxDecoration buttonDecoration({
    Gradient? gradient,
    double? borderRadius,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      gradient: gradient ?? AppGradients.primaryGradient,
      borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusLG),
      boxShadow: boxShadow,
    );
  }

  static BoxDecoration imageContainerDecoration({
    Color? color,
    double? borderRadius,
  }) {
    return BoxDecoration(
      color: color ?? AppColors.surface1,
      borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusLG),
    );
  }

  static BoxDecoration badgeDecoration({
    Color? backgroundColor,
    double? borderRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.primary.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusXL),
    );
  }

  static BoxDecoration borderedContainerDecoration({
    Gradient? gradient,
    Color? borderColor,
    double? borderRadius,
    double? borderWidth,
  }) {
    return BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusLG),
      border: Border.all(
        color: borderColor ?? AppColors.border,
        width: borderWidth ?? AppSpacing.borderWidth,
      ),
    );
  }
}
