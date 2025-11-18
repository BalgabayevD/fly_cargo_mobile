import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';

/// Размеры компонентов приложения
class AppDimensions {
  // Размеры изображений
  static const double imageBoxSize = 160.0;
  static const double imageSmall = 80.0;
  static const double imageMedium = 120.0;
  static const double imageLarge = 200.0;
  
  // Размеры кнопок
  static const double buttonHeightSmall = 40.0;
  static const double buttonHeightMedium = 48.0;
  static const double buttonHeightLarge = 56.0;
  
  // Размеры прогресс-индикаторов
  static const double progressIndicatorSmall = 16.0;
  static const double progressIndicatorMedium = 24.0;
  static const double progressIndicatorLarge = 32.0;
  static const double progressStrokeWidth = 2.0;
  
  // Размеры контейнеров
  static const double containerSmall = 120.0;
  static const double containerMedium = 160.0;
  static const double containerLarge = 200.0;
}

/// Стили теней для компонентов
class AppShadows {
  static BoxShadow get cardShadow => BoxShadow(
        color: AppColors.black.withValues(alpha: 0.08),
        blurRadius: 20,
        offset: const Offset(0, 4),
      );
  
  static BoxShadow get cardShadowLight => BoxShadow(
        color: AppColors.black.withValues(alpha: 0.04),
        blurRadius: 10,
        offset: const Offset(0, 2),
      );
  
  static BoxShadow get buttonShadow => BoxShadow(
        color: AppColors.primary.withValues(alpha: 0.3),
        blurRadius: 12,
        offset: const Offset(0, 4),
      );
  
  static BoxShadow get buttonShadowLight => BoxShadow(
        color: AppColors.primary.withValues(alpha: 0.2),
        blurRadius: 8,
        offset: const Offset(0, 2),
      );
  
  static List<BoxShadow> get cardShadows => [cardShadow];
  static List<BoxShadow> get buttonShadows => [buttonShadow];
}

/// Градиенты приложения
class AppGradients {
  static LinearGradient get primaryGradient => const LinearGradient(
        colors: [AppColors.primary, AppColors.primaryDark],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
  
  static LinearGradient get secondaryGradient => const LinearGradient(
        colors: [AppColors.secondary, AppColors.secondaryDark],
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
          AppColors.secondary.withValues(alpha: opacity),
          AppColors.secondary.withValues(alpha: opacity * 0.5),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}

/// Декорации для контейнеров
class AppDecorations {
  static BoxDecoration cardDecoration({
    Color? color,
    double? borderRadius,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      color: color ?? AppColors.white,
      borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusXL),
      boxShadow: boxShadow ?? AppShadows.cardShadows,
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
      boxShadow: boxShadow ?? AppShadows.buttonShadows,
    );
  }
  
  static BoxDecoration imageContainerDecoration({
    Color? color,
    double? borderRadius,
  }) {
    return BoxDecoration(
      color: color ?? AppColors.surfaceVariant,
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

