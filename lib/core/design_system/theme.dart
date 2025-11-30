import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';
import 'package:fly_cargo/core/design_system/typography.dart';

/// Тема приложения Fly Cargo
class AppTheme {
  static ThemeData get lightTheme {
    final textTheme = GoogleFonts.montserratTextTheme();
    
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTypography.fontFamily,
      
      // Цветовая схема
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primaryLight,
        onPrimaryContainer: AppColors.primaryDark,
        
        secondary: AppColors.secondary,
        onSecondary: AppColors.textPrimary,
        secondaryContainer: AppColors.secondaryLight,
        onSecondaryContainer: AppColors.textSecondary,
        
        tertiary: AppColors.primaryLight,
        onTertiary: AppColors.white,
        
        error: AppColors.error,
        onError: AppColors.white,
        
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        
        surfaceContainerHighest: AppColors.surfaceVariant,
        
        outline: AppColors.border,
        outlineVariant: AppColors.borderLight,
        
        shadow: AppColors.shadow,
        scrim: AppColors.black,
      ),
      
      // Цвета фона
      scaffoldBackgroundColor: AppColors.background,
      
      // Типография
      textTheme: textTheme.copyWith(
        displayLarge: AppTypography.h1,
        displayMedium: AppTypography.h2,
        displaySmall: AppTypography.h3,
        
        headlineLarge: AppTypography.h3,
        headlineMedium: AppTypography.h4,
        headlineSmall: AppTypography.h5,
        
        titleLarge: AppTypography.h5,
        titleMedium: AppTypography.h6,
        titleSmall: AppTypography.cardTitle,
        
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        
        labelLarge: AppTypography.buttonLarge,
        labelMedium: AppTypography.buttonMedium,
        labelSmall: AppTypography.buttonSmall,
      ),
      
      // Стиль AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.h5,
        iconTheme: const IconThemeData(
          color: AppColors.iconPrimary,
          size: AppSpacing.iconSizeLG,
        ),
      ),
      
      // Стиль кнопок
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 2,
          shadowColor: AppColors.shadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
          ),
          minimumSize: Size(0, AppSpacing.buttonHeightMD),
          textStyle: AppTypography.buttonMedium,
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(
            color: AppColors.primary,
            width: AppSpacing.borderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
          ),
          minimumSize: Size(0, AppSpacing.buttonHeightMD),
          textStyle: AppTypography.buttonMedium,
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
          ),
          minimumSize: Size(0, AppSpacing.buttonHeightMD),
          textStyle: AppTypography.buttonMedium,
        ),
      ),
      
      // Стиль карточек
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        ),
        margin: EdgeInsets.zero,
      ),
      
      // Стиль полей ввода
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingLG,
          vertical: AppSpacing.paddingMD,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: const BorderSide(
            color: AppColors.border,
            width: AppSpacing.borderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: const BorderSide(
            color: AppColors.border,
            width: AppSpacing.borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: AppSpacing.borderWidthThick,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: AppSpacing.borderWidth,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: AppSpacing.borderWidthThick,
          ),
        ),
        labelStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.textTertiary,
        ),
        errorStyle: AppTypography.bodySmall.copyWith(
          color: AppColors.error,
        ),
      ),
      
      // Стиль иконок
      iconTheme: const IconThemeData(
        color: AppColors.iconPrimary,
        size: AppSpacing.iconSizeMD,
      ),
      
      // Стиль диалогов
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.white,
        elevation: 8,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusXL),
        ),
        titleTextStyle: AppTypography.h5,
        contentTextStyle: AppTypography.bodyMedium,
      ),
      
      // Стиль Bottom Sheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.white,
        elevation: 8,
        shadowColor: AppColors.shadow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusXL),
          ),
        ),
      ),
      
      // Стиль чипов
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.primaryWithOpacity(0.2),
        disabledColor: AppColors.disabled,
        deleteIconColor: AppColors.iconSecondary,
        labelStyle: AppTypography.bodySmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusRound),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingMD,
          vertical: AppSpacing.paddingSM,
        ),
      ),
      
      // Стиль разделителей
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: AppSpacing.dividerHeight,
        space: AppSpacing.dividerHeight,
      ),
      
      // Стиль переключателей
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.white;
          }
          return AppColors.gray300;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.gray400;
        }),
      ),
      
      // Стиль чекбоксов
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusXS),
        ),
      ),
      
      // Стиль радио-кнопок
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.gray400;
        }),
      ),
      
      // Стиль слайдеров
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.gray300,
        thumbColor: AppColors.primary,
        overlayColor: AppColors.primaryWithOpacity(0.2),
        valueIndicatorColor: AppColors.primary,
        valueIndicatorTextStyle: AppTypography.bodySmall.copyWith(
          color: AppColors.white,
        ),
      ),
      
      // Стиль прогресс-индикаторов
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.gray200,
        circularTrackColor: AppColors.gray200,
      ),
      
      // Стиль Snackbar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.gray800,
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  
  /// Темная тема (можно расширить позже)
  static ThemeData get darkTheme {
    // TODO: Реализовать темную тему при необходимости
    return lightTheme;
  }
}

