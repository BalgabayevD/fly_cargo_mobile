import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';
import 'package:fly_cargo/core/design_system/typography.dart';

enum AppCardVariant { elevated, outlined, filled }

class AppCard extends StatelessWidget {
  final Widget child;
  final AppCardVariant variant;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  const AppCard({
    required this.child,
    super.key,
    this.variant = AppCardVariant.elevated,
    this.padding,
    this.margin,
    this.onTap,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
  });
  @override
  Widget build(BuildContext context) {
    final cardDecoration = _getDecoration();
    final cardPadding = padding ?? EdgeInsets.all(AppSpacing.cardPadding);
    final cardMargin = margin ?? EdgeInsets.zero;
    Widget cardChild = Container(
      padding: cardPadding,
      decoration: cardDecoration,
      child: child,
    );
    if (onTap != null) {
      cardChild = InkWell(
        onTap: onTap,
        borderRadius:
            borderRadius ?? BorderRadius.circular(AppSpacing.radiusMD),
        child: cardChild,
      );
    }
    if (cardMargin != EdgeInsets.zero) {
      cardChild = Container(margin: cardMargin, child: cardChild);
    }
    return cardChild;
  }

  BoxDecoration _getDecoration() {
    switch (variant) {
      case AppCardVariant.elevated:
        return BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppSpacing.radiusMD),
          boxShadow: [
            BoxShadow(
              color: AppColors.surface5.withValues(alpha: 0.1),
              blurRadius: AppSpacing.shadowBlurRadius,
              offset: Offset(0, AppSpacing.shadowOffset),
            ),
          ],
        );
      case AppCardVariant.outlined:
        return BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppSpacing.radiusMD),
          border: Border.all(
            color: AppColors.border,
            width: AppSpacing.borderWidth,
          ),
        );
      case AppCardVariant.filled:
        return BoxDecoration(
          color: backgroundColor ?? AppColors.surface1,
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppSpacing.radiusMD),
        );
    }
  }
}

class AppCardWithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  final AppCardVariant variant;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final Widget? titleAction;
  final TextStyle? titleStyle;
  const AppCardWithTitle({
    required this.title,
    required this.child,
    super.key,
    this.variant = AppCardVariant.elevated,
    this.padding,
    this.margin,
    this.onTap,
    this.titleAction,
    this.titleStyle,
  });
  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: variant,
      padding: padding,
      margin: margin,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: titleStyle ?? AppTypography.cardTitle,
                ),
              ),
              ?titleAction,
            ],
          ),
          SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }
}

class AppIconCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final AppCardVariant variant;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  const AppIconCard({
    required this.icon,
    required this.title,
    super.key,
    this.subtitle,
    this.onTap,
    this.variant = AppCardVariant.elevated,
    this.iconColor,
    this.iconBackgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: variant,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: AppSpacing.avatarSizeMD,
            height: AppSpacing.avatarSizeMD,
            decoration: BoxDecoration(
              color:
                  iconBackgroundColor ??
                  AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
            ),
            child: Icon(
              icon,
              color: iconColor ?? AppColors.primary,
              size: AppSpacing.iconSizeMD,
            ),
          ),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.cardTitle),
                if (subtitle != null) ...[
                  SizedBox(height: AppSpacing.xs),
                  Text(subtitle!, style: AppTypography.subtitleMedium),
                ],
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: AppSpacing.iconSizeSM,
            color: AppColors.surface5,
          ),
        ],
      ),
    );
  }
}

class AppSelectionCard extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? selectedColor;
  final Color? unselectedColor;
  const AppSelectionCard({
    required this.child,
    super.key,
    this.isSelected = false,
    this.onTap,
    this.selectedColor,
    this.unselectedColor,
  });
  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: AppCardVariant.outlined,
      onTap: onTap,
      backgroundColor: isSelected
          ? (selectedColor ?? AppColors.primary.withValues(alpha: 0.1))
          : (unselectedColor ?? AppColors.white),
      borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          border: Border.all(
            color: isSelected
                ? (selectedColor ?? AppColors.primary)
                : AppColors.border,
            width: isSelected
                ? AppSpacing.borderWidthThick
                : AppSpacing.borderWidth,
          ),
        ),
        child: child,
      ),
    );
  }
}

class AppPriceCard extends StatelessWidget {
  final String title;
  final String price;
  final String? subtitle;
  final Widget? child;
  final VoidCallback? onTap;
  final AppCardVariant variant;
  final bool isFullWidth;
  const AppPriceCard({
    required this.title,
    required this.price,
    super.key,
    this.subtitle,
    this.child,
    this.onTap,
    this.variant = AppCardVariant.filled,
    this.isFullWidth = false,
  });
  @override
  Widget build(BuildContext context) {
    Widget cardContent = AppCard(
      variant: variant,
      onTap: onTap,
      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.paddingLG),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.3),
            width: AppSpacing.borderWidth,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: AppTypography.cardTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              price,
              style: AppTypography.priceLarge,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              SizedBox(height: AppSpacing.xs),
              Text(
                subtitle!,
                style: AppTypography.subtitleSmall,
                textAlign: TextAlign.center,
              ),
            ],
            if (child != null) ...[SizedBox(height: AppSpacing.md), child!],
          ],
        ),
      ),
    );
    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: cardContent);
    }
    return cardContent;
  }
}
