import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';
import 'package:fly_cargo/core/design_system/typography.dart';

enum AppButtonSize { small, medium, large, extraLarge }

enum AppButtonVariant { primary, secondary, outline, ghost, danger }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonSize size;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;
  final Widget? child;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = _getButtonStyle();
    final textStyle = _getTextStyle();
    final height = _getHeight();

    Widget buttonChild = _buildButtonChild(textStyle);

    if (isFullWidth) {
      buttonChild = SizedBox(
        width: double.infinity,
        height: height,
        child: buttonChild,
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: buttonStyle,
      child: buttonChild,
    );
  }

  Widget _buildButtonChild(TextStyle textStyle) {
    if (isLoading) {
      return Center(
        child: SizedBox(
          height: _getIconSize(),
          width: _getIconSize(),
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
          ),
        ),
      );
    }

    if (child != null) {
      return Center(child: child!);
    }

    if (icon != null) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: _getIconSize(), color: _getTextColor()),
            SizedBox(width: AppSpacing.sm),
            Flexible(
              child: Text(
                text,
                style: textStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Text(text, style: textStyle, textAlign: TextAlign.center),
    );
  }

  ButtonStyle _getButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: _getBackgroundColor(),
      foregroundColor: _getTextColor(),
      elevation: _getElevation(),
      shadowColor: _getShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getBorderRadius()),
        side: _getBorderSide(),
      ),
      minimumSize: Size(0, _getHeight()),
    );
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case AppButtonSize.small:
        return AppTypography.buttonSmall.copyWith(color: _getTextColor());
      case AppButtonSize.medium:
        return AppTypography.buttonMedium.copyWith(color: _getTextColor());
      case AppButtonSize.large:
        return AppTypography.buttonLarge.copyWith(color: _getTextColor());
      case AppButtonSize.extraLarge:
        return AppTypography.buttonLarge.copyWith(color: _getTextColor());
    }
  }

  double _getHeight() {
    switch (size) {
      case AppButtonSize.small:
        return AppSpacing.buttonHeightSM;
      case AppButtonSize.medium:
        return AppSpacing.buttonHeightMD;
      case AppButtonSize.large:
        return AppSpacing.buttonHeightLG;
      case AppButtonSize.extraLarge:
        return AppSpacing.buttonHeightXL;
    }
  }

  double _getBorderRadius() {
    return AppSpacing.radiusLG;
  }

  double _getIconSize() {
    switch (size) {
      case AppButtonSize.small:
        return AppSpacing.iconSizeSM;
      case AppButtonSize.medium:
        return AppSpacing.iconSizeMD;
      case AppButtonSize.large:
        return AppSpacing.iconSizeMD;
      case AppButtonSize.extraLarge:
        return AppSpacing.iconSizeLG;
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case AppButtonVariant.primary:
        return AppColors.primary;
      case AppButtonVariant.secondary:
        return AppColors.secondary;
      case AppButtonVariant.outline:
        return AppColors.transparent;
      case AppButtonVariant.ghost:
        return AppColors.transparent;
      case AppButtonVariant.danger:
        return AppColors.error;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case AppButtonVariant.primary:
        return AppColors.white;
      case AppButtonVariant.secondary:
        return AppColors.white;
      case AppButtonVariant.outline:
        return AppColors.primary;
      case AppButtonVariant.ghost:
        return AppColors.primary;
      case AppButtonVariant.danger:
        return AppColors.white;
    }
  }

  double _getElevation() {
    switch (variant) {
      case AppButtonVariant.primary:
      case AppButtonVariant.secondary:
      case AppButtonVariant.danger:
        return 2.0;
      case AppButtonVariant.outline:
      case AppButtonVariant.ghost:
        return 0.0;
    }
  }

  Color _getShadowColor() {
    return AppColors.shadow;
  }

  BorderSide _getBorderSide() {
    switch (variant) {
      case AppButtonVariant.outline:
        return BorderSide(
          color: AppColors.primary,
          width: AppSpacing.borderWidth,
        );
      case AppButtonVariant.ghost:
        return BorderSide.none;
      default:
        return BorderSide.none;
    }
  }
}

// Специальные кнопки
class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final AppButtonSize size;
  final AppButtonVariant variant;
  final bool isLoading;

  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.variant = AppButtonVariant.ghost,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = _getSize();

    return SizedBox(
      width: size,
      height: size,
      child: AppButton(
        text: '',
        onPressed: onPressed,
        size: this.size,
        variant: variant,
        isLoading: isLoading,
        child: Icon(icon, size: _getIconSize()),
      ),
    );
  }

  double _getSize() {
    switch (size) {
      case AppButtonSize.small:
        return AppSpacing.avatarSizeSM;
      case AppButtonSize.medium:
        return AppSpacing.avatarSizeMD;
      case AppButtonSize.large:
        return AppSpacing.avatarSizeLG;
      case AppButtonSize.extraLarge:
        return AppSpacing.avatarSizeXL;
    }
  }

  double _getIconSize() {
    switch (size) {
      case AppButtonSize.small:
        return AppSpacing.iconSizeSM;
      case AppButtonSize.medium:
        return AppSpacing.iconSizeMD;
      case AppButtonSize.large:
        return AppSpacing.iconSizeLG;
      case AppButtonSize.extraLarge:
        return AppSpacing.iconSizeXL;
    }
  }
}

// Кнопка с загрузкой
class AppLoadingButton extends StatefulWidget {
  final String text;
  final Future<void> Function()? onPressed;
  final AppButtonSize size;
  final AppButtonVariant variant;
  final bool isFullWidth;
  final IconData? icon;

  const AppLoadingButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.variant = AppButtonVariant.primary,
    this.isFullWidth = false,
    this.icon,
  });

  @override
  State<AppLoadingButton> createState() => _AppLoadingButtonState();
}

class _AppLoadingButtonState extends State<AppLoadingButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: widget.text,
      onPressed: _isLoading ? null : _handlePress,
      size: widget.size,
      variant: widget.variant,
      isLoading: _isLoading,
      isFullWidth: widget.isFullWidth,
      icon: widget.icon,
    );
  }

  Future<void> _handlePress() async {
    if (widget.onPressed == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed!();
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
