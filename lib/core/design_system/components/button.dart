import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';

enum BeButtonVariant { solid, bordered, light, flat, faded, shadow, ghost }

enum BeButtonColor { primary, success, warning, info, danger, gray }

enum BeButtonSize { sm, md, lg }

class BeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? startContent;
  final Widget? endContent;
  final Widget? child;
  final String? text;
  final BeButtonVariant variant;
  final BeButtonColor color;
  final BeButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final Color? backgroundColor;
  final Color? textColor;

  const BeButton({
    super.key,
    this.onPressed,
    this.text,
    this.variant = BeButtonVariant.solid,
    this.color = BeButtonColor.primary,
    this.size = BeButtonSize.lg,
    this.isLoading = false,
    this.isDisabled = false,
    this.backgroundColor,
    this.textColor,
    this.startContent,
    this.child,
    this.endContent,
  });

  Color get _color {
    switch (variant) {
      case BeButtonVariant.solid:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.primary;
          case BeButtonColor.success:
            return BeColors.success;
          case BeButtonColor.info:
            return BeColors.info;
          case BeButtonColor.warning:
            return BeColors.warning;
          case BeButtonColor.danger:
            return BeColors.danger;
          case BeButtonColor.gray:
            return BeColors.surface2;
        }
      case BeButtonVariant.bordered:
        return BeColors.white;
      case BeButtonVariant.faded:
        switch (color) {
          case BeButtonColor.gray:
            return BeColors.surface1;
          default:
            return BeColors.surface2;
        }
      case BeButtonVariant.flat:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.surface2;
          case BeButtonColor.success:
            return BeColors.successLight;
          case BeButtonColor.info:
            return BeColors.infoLight;
          case BeButtonColor.warning:
            return BeColors.warningLight;
          case BeButtonColor.danger:
            return BeColors.dangerLight;
          case BeButtonColor.gray:
            return BeColors.surface2;
        }
      case BeButtonVariant.ghost:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.white;
          case BeButtonColor.success:
            return BeColors.white;
          case BeButtonColor.info:
            return BeColors.white;
          case BeButtonColor.warning:
            return BeColors.white;
          case BeButtonColor.danger:
            return BeColors.white;
          case BeButtonColor.gray:
            return BeColors.white;
        }
      case BeButtonVariant.light:
        return BeColors.none;
      case BeButtonVariant.shadow:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.primary;
          case BeButtonColor.success:
            return BeColors.success;
          case BeButtonColor.info:
            return BeColors.info;
          case BeButtonColor.warning:
            return BeColors.warning;
          case BeButtonColor.danger:
            return BeColors.danger;
          case BeButtonColor.gray:
            return BeColors.surface2;
        }
    }
  }

  Color get _textColor {
    switch (variant) {
      case BeButtonVariant.solid:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.white;
          case BeButtonColor.success:
            return BeColors.white;
          case BeButtonColor.info:
            return BeColors.white;
          case BeButtonColor.warning:
            return BeColors.white;
          case BeButtonColor.danger:
            return BeColors.white;
          case BeButtonColor.gray:
            return BeColors.primary;
        }
      case BeButtonVariant.bordered:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.primary;
          case BeButtonColor.success:
            return BeColors.success;
          case BeButtonColor.info:
            return BeColors.info;
          case BeButtonColor.warning:
            return BeColors.warning;
          case BeButtonColor.danger:
            return BeColors.danger;
          case BeButtonColor.gray:
            return BeColors.primary;
        }
      case BeButtonVariant.faded:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.primary;
          case BeButtonColor.success:
            return BeColors.success;
          case BeButtonColor.info:
            return BeColors.info;
          case BeButtonColor.warning:
            return BeColors.warning;
          case BeButtonColor.danger:
            return BeColors.danger;
          case BeButtonColor.gray:
            return BeColors.primary;
        }
      case BeButtonVariant.flat:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.primary;
          case BeButtonColor.success:
            return BeColors.success;
          case BeButtonColor.info:
            return BeColors.info;
          case BeButtonColor.warning:
            return BeColors.warning;
          case BeButtonColor.danger:
            return BeColors.danger;
          case BeButtonColor.gray:
            return BeColors.primary;
        }
      case BeButtonVariant.ghost:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.primary;
          case BeButtonColor.success:
            return BeColors.success;
          case BeButtonColor.info:
            return BeColors.info;
          case BeButtonColor.warning:
            return BeColors.warning;
          case BeButtonColor.danger:
            return BeColors.danger;
          case BeButtonColor.gray:
            return BeColors.primary;
        }
      case BeButtonVariant.light:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.primary;
          case BeButtonColor.success:
            return BeColors.success;
          case BeButtonColor.info:
            return BeColors.info;
          case BeButtonColor.warning:
            return BeColors.warning;
          case BeButtonColor.danger:
            return BeColors.danger;
          case BeButtonColor.gray:
            return BeColors.primary;
        }
      case BeButtonVariant.shadow:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.white;
          case BeButtonColor.success:
            return BeColors.white;
          case BeButtonColor.info:
            return BeColors.white;
          case BeButtonColor.warning:
            return BeColors.white;
          case BeButtonColor.danger:
            return BeColors.white;
          case BeButtonColor.gray:
            return BeColors.primary;
        }
    }
  }

  double get _height {
    switch (size) {
      case BeButtonSize.lg:
        return 56;
      case BeButtonSize.md:
        return 46;
      case BeButtonSize.sm:
        return 32;
    }
  }

  double get _borderRadius {
    switch (size) {
      case BeButtonSize.lg:
        return 18;
      case BeButtonSize.md:
        return 18;
      case BeButtonSize.sm:
        return 12;
    }
  }

  TextStyle get _textStyle {
    switch (size) {
      case BeButtonSize.lg:
        return TextStyle(fontSize: 17, fontWeight: .w700);
      case BeButtonSize.md:
        return TextStyle(fontSize: 17, fontWeight: .w700);
      case BeButtonSize.sm:
        return TextStyle(fontSize: 12, fontWeight: .w500);
    }
  }

  Color get _borderColor {
    switch (variant) {
      case BeButtonVariant.bordered:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.primary;
          case BeButtonColor.success:
            return BeColors.success;
          case BeButtonColor.warning:
            return BeColors.warning;
          case BeButtonColor.danger:
            return BeColors.danger;
          case BeButtonColor.info:
            return BeColors.info;
          case BeButtonColor.gray:
            return BeColors.surface3;
        }
      case BeButtonVariant.faded:
        return BeColors.surface2;
      case BeButtonVariant.ghost:
        switch (color) {
          case BeButtonColor.primary:
            return BeColors.primary;
          case BeButtonColor.success:
            return BeColors.success;
          case BeButtonColor.warning:
            return BeColors.warning;
          case BeButtonColor.danger:
            return BeColors.danger;
          case BeButtonColor.info:
            return BeColors.info;
          case BeButtonColor.gray:
            return BeColors.surface3;
        }
      default:
        return BeColors.none;
    }
  }

  List<BoxShadow> get _boxShadow {
    switch (size) {
      case BeButtonSize.sm:
        return [
          BoxShadow(
            color: _color,
            blurRadius: 28,
            offset: const Offset(0, 4),
          ),
        ];
      case BeButtonSize.md:
        return [
          BoxShadow(
            color: _color,
            blurRadius: 28,
            offset: const Offset(0, 7),
          ),
        ];
      case BeButtonSize.lg:
        return [
          BoxShadow(
            color: _color,
            blurRadius: 28,
            offset: const Offset(0, 10),
          ),
        ];
    }
  }

  bool get _isBorder =>
      variant == BeButtonVariant.bordered ||
      variant == BeButtonVariant.faded ||
      variant == BeButtonVariant.ghost;

  BorderSide get _border => BorderSide(
    width: _isBorder ? 2 : 0,
    color: _isBorder ? _borderColor : BeColors.none,
  );

  @override
  Widget build(BuildContext context) {
    final button = MaterialButton(
      minWidth: double.infinity,
      disabledElevation: 0,
      focusElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ).copyWith(side: _border),
      highlightElevation: 0,
      hoverElevation: 0,
      elevation: 0,
      highlightColor: BeColors.none,
      splashColor: BeColors.none,
      color: backgroundColor ?? _color,
      height: _height,
      onPressed: () {
        if (onPressed != null && !isDisabled && !isLoading) {
          onPressed!();
        }
      },
      textColor: textColor ?? _textColor,
      child: text != null
          ? Row(
              mainAxisSize: .min,
              mainAxisAlignment: .center,
              spacing: 12,
              children: [
                if (startContent != null) startContent!,
                if (isLoading)
                  SizedBox.square(
                    dimension: 16,
                    child: CircularProgressIndicator(
                      color: textColor ?? _textColor,
                      strokeWidth: 3,
                      backgroundColor: BeColors.none,
                      strokeCap: .round,
                    ),
                  ),
                Text(text!, style: _textStyle),
                if (endContent != null) endContent!,
              ],
            )
          : child,
    );

    if (variant == .shadow) {
      return Container(
        decoration: BoxDecoration(
          boxShadow: _boxShadow,
        ),
        child: button,
      );
    }

    return button;
  }
}
