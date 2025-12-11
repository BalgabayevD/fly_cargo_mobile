import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';

class DesignUtils {
  static SizedBox verticalSpace(double height) => SizedBox(height: height);
  
  static SizedBox horizontalSpace(double width) => SizedBox(width: width);
  
  static const verticalSpaceXS = SizedBox(height: AppSpacing.xs);
  static const verticalSpaceSM = SizedBox(height: AppSpacing.sm);
  static const verticalSpaceMD = SizedBox(height: AppSpacing.md);
  static const verticalSpaceLG = SizedBox(height: AppSpacing.lg);
  static const verticalSpaceXL = SizedBox(height: AppSpacing.xl);
  static const verticalSpaceXXL = SizedBox(height: AppSpacing.xxl);
  
  static const horizontalSpaceXS = SizedBox(width: AppSpacing.xs);
  static const horizontalSpaceSM = SizedBox(width: AppSpacing.sm);
  static const horizontalSpaceMD = SizedBox(width: AppSpacing.md);
  static const horizontalSpaceLG = SizedBox(width: AppSpacing.lg);
  static const horizontalSpaceXL = SizedBox(width: AppSpacing.xl);
  static const horizontalSpaceXXL = SizedBox(width: AppSpacing.xxl);
  
  static Widget divider({
    double? height,
    double? thickness,
    Color? color,
    double? indent,
    double? endIndent,
  }) {
    return Divider(
      height: height ?? AppSpacing.space4,
      thickness: thickness ?? AppSpacing.dividerHeight,
      color: color ?? AppColors.border,
      indent: indent,
      endIndent: endIndent,
    );
  }
  
  static Widget verticalDivider({
    double? width,
    double? thickness,
    Color? color,
    double? indent,
    double? endIndent,
  }) {
    return VerticalDivider(
      width: width ?? AppSpacing.space4,
      thickness: thickness ?? AppSpacing.dividerHeight,
      color: color ?? AppColors.border,
      indent: indent,
      endIndent: endIndent,
    );
  }
  
  static BoxDecoration shadowDecoration({
    Color? backgroundColor,
    double? borderRadius,
    Color? shadowColor,
    double? shadowBlur,
    Offset? shadowOffset,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.white,
      borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusMD),
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? AppColors.shadow,
          blurRadius: shadowBlur ?? AppSpacing.shadowBlurRadius,
          offset: shadowOffset ?? const Offset(0, AppSpacing.shadowOffset),
        ),
      ],
    );
  }
  
  static BoxDecoration gradientDecoration({
    required Gradient gradient,
    double? borderRadius,
    Border? border,
  }) {
    return BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusMD),
      border: border,
    );
  }
  
  static BoxDecoration borderedDecoration({
    Color? backgroundColor,
    double? borderRadius,
    Color? borderColor,
    double? borderWidth,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.white,
      borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusMD),
      border: Border.all(
        color: borderColor ?? AppColors.border,
        width: borderWidth ?? AppSpacing.borderWidth,
      ),
    );
  }
  
  static Widget loader({
    double? size,
    Color? color,
    double? strokeWidth,
  }) {
    return SizedBox(
      width: size ?? AppSpacing.iconSizeLG,
      height: size ?? AppSpacing.iconSizeLG,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? AppColors.primary,
        ),
      ),
    );
  }
  
  static Widget badge({
    required String text,
    Color? backgroundColor,
    Color? textColor,
    EdgeInsets? padding,
  }) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryWithOpacity(0.2),
        borderRadius: BorderRadius.circular(AppSpacing.radiusRound),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? AppColors.primary,
          fontSize: AppSpacing.fontSize10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  
  static Widget avatar({
    String? imageUrl,
    String? initials,
    double? size,
    Color? backgroundColor,
    Color? textColor,
  }) {
    final avatarSize = size ?? AppSpacing.avatarSizeMD;
    
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary,
        shape: BoxShape.circle,
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl == null && initials != null
          ? Center(
              child: Text(
                initials,
                style: TextStyle(
                  color: textColor ?? AppColors.white,
                  fontSize: avatarSize * 0.4,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : null,
    );
  }
  
  static BoxDecoration shimmerDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.gray200,
          AppColors.gray100,
          AppColors.gray200,
        ],
        stops: const [0.0, 0.5, 1.0],
      ),
      borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
    );
  }
  
  static Widget roundedImage({
    required String imageUrl,
    double? width,
    double? height,
    double? borderRadius,
    BoxFit? fit,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusMD),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            color: AppColors.gray200,
            child: const Icon(
              Icons.broken_image,
              color: AppColors.iconTertiary,
            ),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: width,
            height: height,
            decoration: shimmerDecoration(),
          );
        },
      ),
    );
  }
  
  static EdgeInsets get screenPadding => const EdgeInsets.all(AppSpacing.screenPadding);
  
  static EdgeInsets get screenPaddingHorizontal =>
      const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding);
  
  static EdgeInsets get screenPaddingVertical =>
      const EdgeInsets.symmetric(vertical: AppSpacing.screenPadding);
  
  static void showSnackBar(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration? duration,
    SnackBarAction? action,
  }) {
    Color backgroundColor;
    Color textColor = AppColors.white;
    IconData icon;
    
    switch (type) {
      case SnackBarType.success:
        backgroundColor = AppColors.success;
        icon = Icons.check_circle;
        break;
      case SnackBarType.error:
        backgroundColor = AppColors.error;
        icon = Icons.error;
        break;
      case SnackBarType.warning:
        backgroundColor = AppColors.warning;
        icon = Icons.warning;
        textColor = AppColors.textPrimary;
        break;
      case SnackBarType.info:
        backgroundColor = AppColors.info;
        icon = Icons.info;
        break;
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: textColor),
            horizontalSpaceMD,
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration ?? const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        action: action,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        ),
      ),
    );
  }
}

enum SnackBarType {
  success,
  error,
  warning,
  info,
}
