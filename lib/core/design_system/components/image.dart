import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:heroicons/heroicons.dart';

enum BeImagePlaceholderType {
  error,
  loader,
}

class BeImagePlaceholder extends StatelessWidget {
  final BeImagePlaceholderType type;

  const BeImagePlaceholder({
    this.type = .loader,
    super.key,
  });

  static Widget errorBuilder(BuildContext context, _, _) {
    return BeImagePlaceholder(type: .error);
  }

  static Widget loadingBuilder(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    if (loadingProgress != null) {
      return BeImagePlaceholder(type: .loader);
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case .error:
        return Container(
          color: BeColors.surface2,
          child: HeroIcon(
            HeroIcons.noSymbol,
            color: BeColors.surface3,
            size: 28,
          ),
        );
      case .loader:
        return Container(
          color: BeColors.surface2,
        );
    }
  }
}
