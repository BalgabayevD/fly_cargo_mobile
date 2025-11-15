import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';
enum AppIconSize { xs, sm, md, lg, xl }
enum AppIconVariant {
  primary,
  secondary,
  tertiary,
  disabled,
  success,
  warning,
  error,
}
class AppIcon extends StatelessWidget {
  final IconData icon;
  final AppIconSize size;
  final AppIconVariant variant;
  final Color? color;
  final VoidCallback? onTap;
  const AppIcon({
    required this.icon, super.key,
    this.size = AppIconSize.md,
    this.variant = AppIconVariant.primary,
    this.color,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final iconSize = _getSize();
    final iconColor = color ?? _getColor();
    Widget iconWidget = Icon(icon, size: iconSize, color: iconColor);
    if (onTap != null) {
      iconWidget = GestureDetector(onTap: onTap, child: iconWidget);
    }
    return iconWidget;
  }
  double _getSize() {
    switch (size) {
      case AppIconSize.xs:
        return AppSpacing.iconSizeXS;
      case AppIconSize.sm:
        return AppSpacing.iconSizeSM;
      case AppIconSize.md:
        return AppSpacing.iconSizeMD;
      case AppIconSize.lg:
        return AppSpacing.iconSizeLG;
      case AppIconSize.xl:
        return AppSpacing.iconSizeXL;
    }
  }
  Color _getColor() {
    switch (variant) {
      case AppIconVariant.primary:
        return AppColors.iconPrimary;
      case AppIconVariant.secondary:
        return AppColors.iconSecondary;
      case AppIconVariant.tertiary:
        return AppColors.iconTertiary;
      case AppIconVariant.disabled:
        return AppColors.iconDisabled;
      case AppIconVariant.success:
        return AppColors.success;
      case AppIconVariant.warning:
        return AppColors.warning;
      case AppIconVariant.error:
        return AppColors.error;
    }
  }
}
class AppIconContainer extends StatelessWidget {
  final IconData icon;
  final AppIconSize size;
  final AppIconVariant variant;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  final double? borderRadius;
  const AppIconContainer({
    required this.icon, super.key,
    this.size = AppIconSize.md,
    this.variant = AppIconVariant.primary,
    this.backgroundColor,
    this.iconColor,
    this.onTap,
    this.borderRadius,
  });
  @override
  Widget build(BuildContext context) {
    final containerSize = _getContainerSize();
    final iconSize = _getIconSize();
    final bgColor = backgroundColor ?? _getBackgroundColor();
    final icColor = iconColor ?? _getIconColor();
    final radius = borderRadius ?? AppSpacing.radiusSM;
    Widget container = Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Icon(icon, size: iconSize, color: icColor),
    );
    if (onTap != null) {
      container = GestureDetector(onTap: onTap, child: container);
    }
    return container;
  }
  double _getContainerSize() {
    switch (size) {
      case AppIconSize.xs:
        return AppSpacing.avatarSizeSM;
      case AppIconSize.sm:
        return AppSpacing.avatarSizeMD;
      case AppIconSize.md:
        return AppSpacing.avatarSizeMD;
      case AppIconSize.lg:
        return AppSpacing.avatarSizeLG;
      case AppIconSize.xl:
        return AppSpacing.avatarSizeXL;
    }
  }
  double _getIconSize() {
    switch (size) {
      case AppIconSize.xs:
        return AppSpacing.iconSizeXS;
      case AppIconSize.sm:
        return AppSpacing.iconSizeSM;
      case AppIconSize.md:
        return AppSpacing.iconSizeMD;
      case AppIconSize.lg:
        return AppSpacing.iconSizeLG;
      case AppIconSize.xl:
        return AppSpacing.iconSizeXL;
    }
  }
  Color _getBackgroundColor() {
    switch (variant) {
      case AppIconVariant.primary:
        return AppColors.primaryWithOpacity(0.1);
      case AppIconVariant.secondary:
        return AppColors.secondaryWithOpacity(0.1);
      case AppIconVariant.tertiary:
        return AppColors.gray100;
      case AppIconVariant.disabled:
        return AppColors.gray200;
      case AppIconVariant.success:
        return AppColors.success.withValues(alpha: 0.1);
      case AppIconVariant.warning:
        return AppColors.warning.withValues(alpha: 0.1);
      case AppIconVariant.error:
        return AppColors.error.withValues(alpha: 0.1);
    }
  }
  Color _getIconColor() {
    switch (variant) {
      case AppIconVariant.primary:
        return AppColors.primary;
      case AppIconVariant.secondary:
        return AppColors.secondary;
      case AppIconVariant.tertiary:
        return AppColors.iconTertiary;
      case AppIconVariant.disabled:
        return AppColors.iconDisabled;
      case AppIconVariant.success:
        return AppColors.success;
      case AppIconVariant.warning:
        return AppColors.warning;
      case AppIconVariant.error:
        return AppColors.error;
    }
  }
}
class AppIconWithBadge extends StatelessWidget {
  final IconData icon;
  final AppIconSize size;
  final AppIconVariant variant;
  final String? badgeText;
  final int? badgeCount;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final VoidCallback? onTap;
  const AppIconWithBadge({
    required this.icon, super.key,
    this.size = AppIconSize.md,
    this.variant = AppIconVariant.primary,
    this.badgeText,
    this.badgeCount,
    this.badgeColor,
    this.badgeTextColor,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppIcon(icon: icon, size: size, variant: variant, onTap: onTap),
        if (badgeText != null || badgeCount != null)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: badgeColor ?? AppColors.error,
                borderRadius: BorderRadius.circular(AppSpacing.radiusRound),
              ),
              constraints: BoxConstraints(
                minWidth: AppSpacing.iconSizeSM,
                minHeight: AppSpacing.iconSizeSM,
              ),
              child: Text(
                badgeText ?? badgeCount.toString(),
                style: TextStyle(
                  color: badgeTextColor ?? AppColors.white,
                  fontSize: AppSpacing.fontSize10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
class AppAnimatedIcon extends StatefulWidget {
  final IconData icon;
  final AppIconSize size;
  final AppIconVariant variant;
  final Duration duration;
  final VoidCallback? onTap;
  const AppAnimatedIcon({
    required this.icon, super.key,
    this.size = AppIconSize.md,
    this.variant = AppIconVariant.primary,
    this.duration = const Duration(milliseconds: 200),
    this.onTap,
  });
  @override
  State<AppAnimatedIcon> createState() => _AppAnimatedIconState();
}
class _AppAnimatedIconState extends State<AppAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AppIcon(
              icon: widget.icon,
              size: widget.size,
              variant: widget.variant,
            ),
          );
        },
      ),
    );
  }
}
