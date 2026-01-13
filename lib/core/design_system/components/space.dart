import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';

enum BeSpacingSize {
  /// **2px** — extra small
  xs,

  /// **2px**
  sm,

  /// **2px**
  md,

  /// **2px**
  lg,

  /// **2px**
  xl,

  /// **2px**
  xxl,

  /// **2px**
  xxxl,
}

enum BeSpacingDirection {
  horizontal,
  vertical,
}

class BeSpace extends StatelessWidget {
  final BeSpacingSize size;
  final BeSpacingDirection direction;

  const BeSpace({
    super.key,
    this.size = .md,
    this.direction = .horizontal,
  });

  double get _size {
    switch (size) {
      case BeSpacingSize.xs:
        return AppSpacing.space1;
      case BeSpacingSize.sm:
        return AppSpacing.space2;
      case BeSpacingSize.md:
        return AppSpacing.space3;
      case BeSpacingSize.lg:
        return AppSpacing.space4;
      case BeSpacingSize.xl:
        return AppSpacing.space5;
      case BeSpacingSize.xxl:
        return AppSpacing.space6;
      case BeSpacingSize.xxxl:
        return AppSpacing.space8;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (direction) {
      case BeSpacingDirection.horizontal:
        return SizedBox(height: _size);
      case BeSpacingDirection.vertical:
        return SizedBox(width: _size);
    }
  }
}
