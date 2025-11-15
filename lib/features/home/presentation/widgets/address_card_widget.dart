import 'package:flutter/material.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';

mixin AddressCardStyling {
  static const double iconContainerSize = 48.0;
  static const double editIconSize = 16.0;
  static const double editContainerSize = 32.0;
  static const double borderRadius = 12.0;
  static const double editBorderRadius = 8.0;
  static const double spacing = 16.0;
  static const double padding = 16.0;
  static const double borderWidth = 1.0;
  static const double shadowBlur = 8.0;
  static const double shadowOffset = 2.0;
  static const double shadowAlpha = 0.05;
}

class AddressCardWidget extends StatelessWidget with AddressCardStyling {
  final AddressModel address;
  final String label;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const AddressCardWidget({
    super.key,
    required this.address,
    required this.label,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AddressCardStyling.padding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AddressCardStyling.borderRadius),
          border: Border.all(
            color: const Color(0xFFE0E0E0),
            width: AddressCardStyling.borderWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: AddressCardStyling.shadowAlpha),
              blurRadius: AddressCardStyling.shadowBlur,
              offset: const Offset(0, AddressCardStyling.shadowOffset),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: AddressCardStyling.iconContainerSize,
              height: AddressCardStyling.iconContainerSize,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AddressCardStyling.borderRadius),
              ),
              child: const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: AddressCardStyling.spacing),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address.city,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    address.address,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: AddressCardStyling.editContainerSize,
              height: AddressCardStyling.editContainerSize,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(AddressCardStyling.editBorderRadius),
              ),
              child: const Icon(
                Icons.edit,
                color: Color(0xFF666666),
                size: AddressCardStyling.editIconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
