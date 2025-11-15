import 'package:flutter/material.dart';

mixin StatItemStyling {
  static const double iconSize = 24.0;
  static const double containerSize = 50.0;
  static const double borderRadius = 12.0;
  static const double spacing = 8.0;
  static const double labelSpacing = 4.0;
  static const double alpha = 0.1;
}

class StatItemWidget extends StatelessWidget with StatItemStyling {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const StatItemWidget({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: StatItemStyling.containerSize,
          height: StatItemStyling.containerSize,
          decoration: BoxDecoration(
            color: color.withValues(alpha: StatItemStyling.alpha),
            borderRadius: BorderRadius.circular(StatItemStyling.borderRadius),
          ),
          child: Icon(icon, color: color, size: StatItemStyling.iconSize),
        ),
        const SizedBox(height: StatItemStyling.spacing),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: StatItemStyling.labelSpacing),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
        ),
      ],
    );
  }
}
