import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

enum ListTileStyle {
  normal,
  bordered,
}

enum ListTileVariant {
  fluid,
  field,
  checkbox,
  flat,
}

class CheckboxMark extends StatelessWidget {
  final bool isSelected;
  final Color? selectedColor;
  final Color? unSelectedColor;

  const CheckboxMark({
    this.isSelected = false,
    this.selectedColor,
    this.unSelectedColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Container(
        decoration: BoxDecoration(
          color: selectedColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        width: 24,
        height: 24,
        alignment: .center,
        child: Container(
          decoration: BoxDecoration(
            color: BeColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 10,
          height: 10,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: BeColors.border),
        borderRadius: BorderRadius.circular(24),
      ),
      width: 24,
      height: 24,
    );
  }
}

class BaseListTile extends StatelessWidget {
  final Widget? child;
  final double height;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final List<String?> errors;

  const BaseListTile({
    this.child,
    this.height = 72,
    super.key,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.errors = const <String?>[],
  });

  @override
  Widget build(BuildContext context) {
    final anyError = errors.any((text) => text != null);
    final errorText = anyError
        ? errors.firstWhere((text) => text != null)
        : null;

    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Container(
          padding: padding,
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? BeColors.white,
            border: Border.all(
              color: errorText != null
                  ? BeColors.danger
                  : borderColor ?? BeColors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(left: 16, top: 4),
            child: Text(
              errorText,
              style: GoogleFonts.montserrat(
                fontSize: 13,
                height: 1,
                fontWeight: .w600,
                color: BeColors.danger,
              ),
            ),
          ),
      ],
    );
  }
}

class ListTile extends StatelessWidget {
  final bool isSelected;
  final String? image;
  final ListTileStyle style;
  final ListTileVariant variant;
  final VoidCallback? onTap;

  const ListTile({
    this.onTap,
    this.image,
    this.isSelected = false,
    this.style = .normal,
    this.variant = .field,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(),
    );
  }
}

class CheckListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final Widget? image;
  final String? title;
  final String? description;
  final bool isSelected;

  const CheckListTile({
    this.child,
    this.onTap,
    this.title,
    this.image,
    this.description,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BaseListTile(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          crossAxisAlignment: .center,
          spacing: 16,
          children: [
            CheckboxMark(isSelected: isSelected),

            if (image != null)
              Container(
                width: 62,
                height: 42,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: BeColors.border),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: image!,
                ),
              ),

            if (child == null)
              Expanded(
                child: Column(
                  spacing: 3,
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    if (title != null)
                      Text(
                        title!,
                        style: GoogleFonts.montserrat(
                          fontSize: 17,
                          height: 1,
                          fontWeight: .w500,
                          color: BeColors.surface5,
                        ),
                      ),
                    if (description != null)
                      Text(
                        description!,
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          height: 1,
                          color: BeColors.surface4,
                        ),
                      ),
                  ],
                ),
              ),

            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}

enum FieldListTileVariant {
  flat,
  bordered,
}

enum FieldListTileColor {
  normal,
  danger,
}

class FieldListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isShowIcon;
  final HeroIcons icon;
  final String label;
  final String? value;
  final FieldListTileVariant variant;
  final FieldListTileColor color;
  final List<String?> errors;
  final bool disabled;

  const FieldListTile({
    required this.label,
    this.value,
    this.onTap,
    this.errors = const <String?>[],
    this.isShowIcon = true,
    this.disabled = false,
    this.variant = .flat,
    this.color = .normal,
    this.icon = .chevronRight,
    super.key,
  });

  MainAxisAlignment get _alignment {
    if (value != null) {
      return .spaceBetween;
    }
    return .center;
  }

  TextStyle get _labelStyle {
    if (value != null) {
      return GoogleFonts.montserrat(
        fontSize: 13,
        height: 1,
        fontWeight: .w500,
        color: BeColors.surface4,
      );
    }
    return GoogleFonts.montserrat(
      fontSize: 17,
      fontWeight: .w500,
      color: BeColors.surface4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? () {} : onTap,
      child: BaseListTile(
        errors: errors,
        backgroundColor: disabled ? BeColors.surface2 : BeColors.white,
        padding: const EdgeInsets.only(
          left: 12,
          right: 10,
          top: 16,
          bottom: 12,
        ),
        borderColor: variant == .bordered ? BeColors.border : null,
        child: Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .spaceBetween,
          spacing: 16,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: _alignment,
                crossAxisAlignment: .start,
                children: [
                  Text(label, style: _labelStyle),

                  if (value != null)
                    Text(
                      value!,
                      overflow: .ellipsis,
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        height: 1,
                        fontWeight: .w500,
                        color: BeColors.surface5,
                      ),
                    ),
                ],
              ),
            ),

            if (isShowIcon)
              HeroIcon(
                icon,
                size: 24,
                color: BeColors.surface4,
              ),
          ],
        ),
      ),
    );
  }
}

class FlatListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  final String value;
  final bool isFluid;

  const FlatListTile({
    required this.label,
    required this.value,
    this.onTap,
    this.isFluid = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BaseListTile(
        padding: const EdgeInsets.only(
          left: 0,
          right: 0,
          top: 14,
          bottom: 10,
        ),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .start,
          children: [
            Flexible(
              child: Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  height: 1,
                  fontWeight: .w500,
                  color: BeColors.surface4,
                ),
              ),
            ),

            Flexible(
              child: Text(
                value,
                overflow: .ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: 19,
                  fontWeight: .w500,
                  color: BeColors.surface5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LightListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? endContent;

  final String? title;
  final String? description;

  const LightListTile({
    this.endContent,
    this.onTap,
    this.title,
    this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BaseListTile(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .spaceBetween,
          children: [
            if (title != null)
              Text(
                title!,
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  fontWeight: .w500,
                  color: BeColors.surface5,
                ),
              ),

            if (endContent == null && description != null)
              Text(
                description!,
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  fontWeight: .w500,
                  color: BeColors.surface4,
                ),
              ),

            if (endContent != null) endContent!,
          ],
        ),
      ),
    );
  }
}

enum OrderListTileColor { normal, warning, danger, info, success }

enum OrderListTileVariant {
  ghost,
  bordered,
  flat,
}

class OrderListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String? message;
  final String? statusLabel;
  final String? trailing;
  final OrderListTileColor color;
  final OrderListTileVariant varinant;

  const OrderListTile({
    required this.title,
    this.message,
    this.onTap,
    this.statusLabel,
    this.trailing,
    this.color = .normal,
    this.varinant = .flat,
    super.key,
  });

  Color get backgroundColor {
    switch (varinant) {
      case .ghost:
        switch (color) {
          case .normal:
            return BeColors.white;
          case .warning:
            return BeColors.warningLight;
          case .danger:
            return BeColors.dangerLight;
          case .info:
            return BeColors.infoLight;
          case .success:
            return BeColors.successLight;
        }
      case .flat:
        switch (color) {
          case .normal:
            return BeColors.white;
          case .warning:
            return BeColors.warningLight;
          case .danger:
            return BeColors.dangerLight;
          case .info:
            return BeColors.infoLight;
          case .success:
            return BeColors.successLight;
        }
      case .bordered:
        return BeColors.white;
    }
  }

  Color get borderColor {
    switch (varinant) {
      case .ghost:
        switch (color) {
          case .normal:
            return BeColors.white;
          case .warning:
            return BeColors.warning;
          case .danger:
            return BeColors.danger;
          case .info:
            return BeColors.info;
          case .success:
            return BeColors.success;
        }
      case .flat:
        switch (color) {
          case .normal:
            return BeColors.white;
          case .warning:
            return BeColors.warningLight;
          case .danger:
            return BeColors.dangerLight;
          case .info:
            return BeColors.infoLight;
          case .success:
            return BeColors.successLight;
        }
      case .bordered:
        switch (color) {
          case .normal:
            return BeColors.surface3;
          case .warning:
            return BeColors.warning;
          case .danger:
            return BeColors.danger;
          case .info:
            return BeColors.info;
          case .success:
            return BeColors.success;
        }
    }
  }

  Color get _statusColor {
    switch (color) {
      case .normal:
        return BeColors.surface5;
      case .warning:
        return BeColors.warning;
      case .danger:
        return BeColors.danger;
      case .info:
        return BeColors.info;
      case .success:
        return BeColors.success;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BaseListTile(
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        height: 112,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .spaceBetween,
              spacing: 16,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 19,
                    fontWeight: .w600,
                    color: BeColors.surface5,
                  ),
                ),

                if (trailing != null)
                  Text(
                    trailing!,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: BeColors.surface5,
                    ),
                  ),
              ],
            ),

            if (message != null)
              Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  message!,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    height: 1,
                    color: BeColors.surface4,
                  ),
                ),
              ),

            if (statusLabel != null)
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Text(
                  statusLabel!,
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    height: 1,
                    fontWeight: .w600,
                    color: _statusColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BeSwitchListTile extends StatelessWidget {
  final void Function(bool value)? onTap;
  final String? title;
  final String? description;
  final bool isSelected;

  const BeSwitchListTile({
    this.onTap,
    this.title,
    this.description,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseListTile(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        crossAxisAlignment: .center,
        spacing: 16,
        children: [
          Expanded(
            child: Column(
              spacing: 3,
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      height: 1,
                      fontWeight: .w500,
                      color: BeColors.surface5,
                    ),
                  ),
                if (description != null)
                  Text(
                    description!,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      height: 1,
                      color: BeColors.surface4,
                    ),
                  ),
              ],
            ),
          ),

          Switch(
            value: isSelected,
            onChanged: (value) {
              if (onTap != null) {
                onTap!(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
