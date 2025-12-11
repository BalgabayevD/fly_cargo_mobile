import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';
import 'package:fly_cargo/core/design_system/typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final textTheme = GoogleFonts.montserratTextTheme();
    
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTypography.fontFamily,
      
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primary.withValues(alpha: 0.1),
        onPrimaryContainer: AppColors.primary.withValues(alpha: 0.8),
        
        secondary: AppColors.info,
        onSecondary: AppColors.surface5,
        secondaryContainer: AppColors.info.withValues(alpha: 0.1),
        onSecondaryContainer: AppColors.surface5,
        
        tertiary: AppColors.primary.withValues(alpha: 0.1),
        onTertiary: AppColors.white,
        
        error: AppColors.danger,
        onError: AppColors.white,
        
        surface: AppColors.surface1,
        onSurface: AppColors.surface5,
        
        surfaceContainerHighest: AppColors.surface2,
        
        outline: AppColors.surface3,
          outlineVariant: AppColors.surface3,

        shadow: AppColors.surface5.withValues(alpha: 0.1),
        scrim: AppColors.surface5,
      ),
      
      scaffoldBackgroundColor: AppColors.white,
      
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
      
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.surface5,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.h5,
        iconTheme: const IconThemeData(
          color: AppColors.primary,
          size: AppSpacing.iconSizeLG,
        ),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 2,
          shadowColor: AppColors.surface5.withValues(alpha: 0.1),
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
      
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.surface5.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        ),
        margin: EdgeInsets.zero,
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface1,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingLG,
          vertical: AppSpacing.paddingMD,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: BorderSide(
            color: AppColors.surface3,
            width: AppSpacing.borderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: BorderSide( 
            color: AppColors.surface3,
            width: AppSpacing.borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: AppSpacing.borderWidthThick,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: BorderSide(
            color: AppColors.danger,
            width: AppSpacing.borderWidth,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: BorderSide(
            color: AppColors.danger,
            width: AppSpacing.borderWidthThick,
          ),
        ),
        labelStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.surface5,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.surface5,
        ),
        errorStyle: AppTypography.bodySmall.copyWith(
          color: AppColors.danger,
        ),
      ),
      
      iconTheme: const IconThemeData(
        color: AppColors.primary,
        size: AppSpacing.iconSizeMD,
      ),
      
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.white,
        elevation: 8,
        shadowColor: AppColors.surface5.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusXL),
        ),
        titleTextStyle: AppTypography.h5,
        contentTextStyle: AppTypography.bodyMedium,
      ),
      
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.white,
        elevation: 8,
        shadowColor: AppColors.surface5.withValues(alpha: 0.1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusXL),
          ),
        ),
      ),
      
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surface1,
        selectedColor: AppColors.primary.withValues(alpha: 0.2),
        disabledColor: AppColors.surface3,
        deleteIconColor: AppColors.info,
        labelStyle: AppTypography.bodySmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusRound),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingMD,
          vertical: AppSpacing.paddingSM,
        ),
      ),
      
      dividerTheme: DividerThemeData(
            color: AppColors.surface3,
        thickness: AppSpacing.dividerHeight,
        space: AppSpacing.dividerHeight,
      ),
      
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.white;
          }
          return AppColors.surface3;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.surface4;
        }),
      ),
      
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.none;
        }),
        checkColor: WidgetStateProperty.all(AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusXS),
        ),
      ),
      
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.surface4;
        }),
      ),
      
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.surface3,
        thumbColor: AppColors.primary,
        overlayColor: AppColors.primary.withValues(alpha: 0.2),
        valueIndicatorColor: AppColors.primary,
        valueIndicatorTextStyle: AppTypography.bodySmall.copyWith(
          color: AppColors.white,
        ),
      ),
      
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primary,
            linearTrackColor: AppColors.surface2,
        circularTrackColor: AppColors.surface2,
      ),
      
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surface5,
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
  
  static ThemeData get darkTheme {
    return lightTheme;
  }
}
