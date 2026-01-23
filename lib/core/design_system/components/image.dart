import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:heroicons/heroicons.dart';

class BeImagePlaceholder extends StatelessWidget {
  const BeImagePlaceholder({super.key});

  static Widget errorBuilder(BuildContext context, _, __) {
    return BeImagePlaceholder();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BeColors.surface2,
      child: HeroIcon(
        HeroIcons.noSymbol,
        color: BeColors.surface3,
        size: 28,
      ),
    );
  }
}
