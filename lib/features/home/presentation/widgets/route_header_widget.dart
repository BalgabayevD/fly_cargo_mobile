import 'package:flutter/material.dart';
mixin RouteHeaderStyling {
  static const double iconSize = 18.0;
  static const double containerSize = 32.0;
  static const double borderRadius = 8.0;
  static const double spacing = 12.0;
  static const double padding = 16.0;
  static const double borderWidth = 1.0;
}
class RouteHeaderWidget extends StatelessWidget with RouteHeaderStyling {
  final VoidCallback onEditTap;
  const RouteHeaderWidget({
    required this.onEditTap, super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(RouteHeaderStyling.padding),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
          width: RouteHeaderStyling.borderWidth,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: RouteHeaderStyling.containerSize,
                  height: RouteHeaderStyling.containerSize,
                  decoration: BoxDecoration(
                    color: const Color(0xFF007AFF),
                    borderRadius: BorderRadius.circular(RouteHeaderStyling.borderRadius),
                  ),
                  child: const Icon(
                    Icons.route,
                    color: Colors.white,
                    size: RouteHeaderStyling.iconSize,
                  ),
                ),
                const SizedBox(width: RouteHeaderStyling.spacing),
                const Expanded(
                  child: Text(
                    'Маршрут доставки',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onEditTap,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: const Color(0xFF007AFF).withValues(alpha: 0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(RouteHeaderStyling.borderRadius),
              ),
            ),
            child: const Text(
              'Изменить',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
