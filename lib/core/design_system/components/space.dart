import 'package:flutter/material.dart';

enum BeSpacingSize {
  /// **4.0px**
  xs,

  /// **8.0px**
  sm,

  /// **12.0px**
  md,

  /// **16.0px**
  lg,

  /// **20.0px**
  xl,

  /// **24.0px**
  xxl,

  /// **32.0px**
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
        return 4.0;
      case BeSpacingSize.sm:
        return 8.0;
      case BeSpacingSize.md:
        return 12.0;
      case BeSpacingSize.lg:
        return 16.0;
      case BeSpacingSize.xl:
        return 20.0;
      case BeSpacingSize.xxl:
        return 24.0;
      case BeSpacingSize.xxxl:
        return 32.0;
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
