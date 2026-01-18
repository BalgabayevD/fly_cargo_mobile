import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';

enum BeChipVariant { solid, bordered, light, flat, faded, shadow, ghost }

enum BeChipColor { primary, success, warning, info, danger, gray }

enum BeChipSize { sm, md, lg }

class BeChip extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? startContent;
  final Widget? endContent;
  final String? text;
  final BeChipVariant variant;
  final BeChipColor color;
  final BeChipSize size;
  final bool isLoading;
  final bool isDisabled;
  final Color? textColor;
  final Color? backgroundColor;

  const BeChip({
    super.key,
    this.text,
    this.variant = .solid,
    this.color = .primary,
    this.size = .lg,
    this.isLoading = false,
    this.isDisabled = false,
    this.startContent,
    this.endContent,
    this.textColor,
    this.backgroundColor,
    this.onTap,
  });

  Color get _color {
    switch (variant) {
      case BeChipVariant.solid:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.primary;
          case BeChipColor.success:
            return BeColors.success;
          case BeChipColor.info:
            return BeColors.info;
          case BeChipColor.warning:
            return BeColors.warning;
          case BeChipColor.danger:
            return BeColors.danger;
          case BeChipColor.gray:
            return BeColors.surface2;
        }
      case BeChipVariant.bordered:
        return BeColors.white;
      case BeChipVariant.faded:
        switch (color) {
          case BeChipColor.gray:
            return BeColors.surface1;
          default:
            return BeColors.surface2;
        }
      case BeChipVariant.flat:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.surface2;
          case BeChipColor.success:
            return BeColors.successLight;
          case BeChipColor.info:
            return BeColors.infoLight;
          case BeChipColor.warning:
            return BeColors.warningLight;
          case BeChipColor.danger:
            return BeColors.dangerLight;
          case BeChipColor.gray:
            return BeColors.surface2;
        }
      case BeChipVariant.ghost:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.white;
          case BeChipColor.success:
            return BeColors.white;
          case BeChipColor.info:
            return BeColors.white;
          case BeChipColor.warning:
            return BeColors.white;
          case BeChipColor.danger:
            return BeColors.white;
          case BeChipColor.gray:
            return BeColors.white;
        }
      case BeChipVariant.light:
        return BeColors.none;
      case BeChipVariant.shadow:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.primary;
          case BeChipColor.success:
            return BeColors.success;
          case BeChipColor.info:
            return BeColors.info;
          case BeChipColor.warning:
            return BeColors.warning;
          case BeChipColor.danger:
            return BeColors.danger;
          case BeChipColor.gray:
            return BeColors.surface2;
        }
    }
  }

  Color get _textColor {
    switch (variant) {
      case BeChipVariant.solid:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.white;
          case BeChipColor.success:
            return BeColors.white;
          case BeChipColor.info:
            return BeColors.white;
          case BeChipColor.warning:
            return BeColors.white;
          case BeChipColor.danger:
            return BeColors.white;
          case BeChipColor.gray:
            return BeColors.primary;
        }
      case BeChipVariant.bordered:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.primary;
          case BeChipColor.success:
            return BeColors.success;
          case BeChipColor.info:
            return BeColors.info;
          case BeChipColor.warning:
            return BeColors.warning;
          case BeChipColor.danger:
            return BeColors.danger;
          case BeChipColor.gray:
            return BeColors.primary;
        }
      case BeChipVariant.faded:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.primary;
          case BeChipColor.success:
            return BeColors.success;
          case BeChipColor.info:
            return BeColors.info;
          case BeChipColor.warning:
            return BeColors.warning;
          case BeChipColor.danger:
            return BeColors.danger;
          case BeChipColor.gray:
            return BeColors.primary;
        }
      case BeChipVariant.flat:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.primary;
          case BeChipColor.success:
            return BeColors.success;
          case BeChipColor.info:
            return BeColors.info;
          case BeChipColor.warning:
            return BeColors.warning;
          case BeChipColor.danger:
            return BeColors.danger;
          case BeChipColor.gray:
            return BeColors.primary;
        }
      case BeChipVariant.ghost:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.primary;
          case BeChipColor.success:
            return BeColors.success;
          case BeChipColor.info:
            return BeColors.info;
          case BeChipColor.warning:
            return BeColors.warning;
          case BeChipColor.danger:
            return BeColors.danger;
          case BeChipColor.gray:
            return BeColors.primary;
        }
      case BeChipVariant.light:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.primary;
          case BeChipColor.success:
            return BeColors.success;
          case BeChipColor.info:
            return BeColors.info;
          case BeChipColor.warning:
            return BeColors.warning;
          case BeChipColor.danger:
            return BeColors.danger;
          case BeChipColor.gray:
            return BeColors.primary;
        }
      case BeChipVariant.shadow:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.white;
          case BeChipColor.success:
            return BeColors.white;
          case BeChipColor.info:
            return BeColors.white;
          case BeChipColor.warning:
            return BeColors.white;
          case BeChipColor.danger:
            return BeColors.white;
          case BeChipColor.gray:
            return BeColors.primary;
        }
    }
  }

  double get _height {
    switch (size) {
      case BeChipSize.lg:
        return 32;
      case BeChipSize.md:
        return 28;
      case BeChipSize.sm:
        return 24;
    }
  }

  double get _borderRadius {
    switch (size) {
      case BeChipSize.lg:
        return 32;
      case BeChipSize.md:
        return 28;
      case BeChipSize.sm:
        return 24;
    }
  }

  double get _spinner {
    switch (size) {
      case BeChipSize.lg:
        return 16;
      case BeChipSize.md:
        return 16;
      case BeChipSize.sm:
        return 14;
    }
  }

  double get _spacing {
    switch (size) {
      case BeChipSize.lg:
        return 12;
      case BeChipSize.md:
        return 9;
      case BeChipSize.sm:
        return 6;
    }
  }

  double get _stroke {
    switch (size) {
      case BeChipSize.lg:
        return 3;
      case BeChipSize.md:
        return 2;
      case BeChipSize.sm:
        return 2;
    }
  }

  TextStyle get _textStyle {
    switch (size) {
      case BeChipSize.lg:
        return TextStyle(
          fontSize: 16,
          fontWeight: .w700,
          color: _textColor,
        );
      case BeChipSize.md:
        return TextStyle(
          fontSize: 14,
          fontWeight: .w700,
          color: _textColor,
        );
      case BeChipSize.sm:
        return TextStyle(
          fontSize: 12,
          fontWeight: .w500,
          color: _textColor,
        );
    }
  }

  Color get _borderColor {
    switch (variant) {
      case BeChipVariant.bordered:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.primary;
          case BeChipColor.success:
            return BeColors.success;
          case BeChipColor.warning:
            return BeColors.warning;
          case BeChipColor.danger:
            return BeColors.danger;
          case BeChipColor.info:
            return BeColors.info;
          case BeChipColor.gray:
            return BeColors.surface3;
        }
      case BeChipVariant.faded:
        return BeColors.surface2;
      case BeChipVariant.ghost:
        switch (color) {
          case BeChipColor.primary:
            return BeColors.primary;
          case BeChipColor.success:
            return BeColors.success;
          case BeChipColor.warning:
            return BeColors.warning;
          case BeChipColor.danger:
            return BeColors.danger;
          case BeChipColor.info:
            return BeColors.info;
          case BeChipColor.gray:
            return BeColors.surface3;
        }
      default:
        return BeColors.none;
    }
  }

  List<BoxShadow> get _boxShadow {
    switch (size) {
      case BeChipSize.sm:
        return [
          BoxShadow(
            color: _color,
            blurRadius: 28,
            offset: const Offset(0, 4),
          ),
        ];
      case BeChipSize.md:
        return [
          BoxShadow(
            color: _color,
            blurRadius: 28,
            offset: const Offset(0, 7),
          ),
        ];
      case BeChipSize.lg:
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
      variant == BeChipVariant.bordered ||
      variant == BeChipVariant.faded ||
      variant == BeChipVariant.ghost;

  BorderSide get _border => BorderSide(
    width: _isBorder ? 2 : 0,
    color: _isBorder ? _borderColor : BeColors.none,
  );

  @override
  Widget build(BuildContext context) {
    final chip = GestureDetector(
      onTap: () {
        if (onTap != null && !isDisabled && !isLoading) {
          onTap!();
        }
      },
      child: Container(
        height: _height,
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: backgroundColor ?? _color,
          borderRadius: BorderRadius.circular(_borderRadius),
          border: Border.fromBorderSide(_border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: .center,
          spacing: _spacing,
          children: [
            if (startContent != null) startContent!,
            if (isLoading)
              SizedBox.square(
                dimension: _spinner,
                child: CircularProgressIndicator(
                  color: textColor ?? _textColor,
                  strokeWidth: _stroke,
                  backgroundColor: BeColors.none,
                  strokeCap: .round,
                ),
              ),
            Flexible(
              child: Text(text!, style: _textStyle),
            ),
            if (endContent != null) endContent!,
          ],
        ),
      ),
    );

    if (variant == .shadow) {
      return Container(
        decoration: BoxDecoration(
          boxShadow: _boxShadow,
        ),
        child: chip,
      );
    }

    return chip;
  }
}
