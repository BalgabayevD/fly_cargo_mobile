import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:heroicons/heroicons.dart';

class TimelineThumb extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isSelected;
  final HeroIcons icon;

  const TimelineThumb({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    this.isSelected = false,
    this.icon = HeroIcons.check,
  });

  double get _height {
    return 28 + (isFirst ? 0 : 20) + (isLast ? 0 : 20);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: _height,
      child: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          if (!isFirst)
            Container(
              width: 2,
              height: 20,
              color: isFirst ? BeColors.white : BeColors.primary,
            ),
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? BeColors.primary : BeColors.white,
              border: Border.all(
                color: BeColors.primary,
                width: 2,
              ),
            ),
            child: HeroIcon(
              icon,
              size: 16,
              color: isSelected ? BeColors.white : BeColors.none,
            ),
          ),
          if (!isLast)
            Container(
              width: 2,
              height: 20,
              color: isLast ? BeColors.white : BeColors.primary,
            ),
        ],
      ),
    );
  }
}
