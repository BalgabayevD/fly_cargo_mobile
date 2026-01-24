import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/image.dart';

class OrderPhotoViewButton extends StatelessWidget {
  final String photo;
  final VoidCallback? onTap;
  final double height;
  final double width;

  const OrderPhotoViewButton({
    required this.photo,
    super.key,
    this.onTap,
    this.height = 164,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: BeColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: BeColors.white,
              width: 1,
            ),
          ),
          child: Image.network(
            photo,
            height: height,
            width: width,
            fit: .cover,
            loadingBuilder: BeImagePlaceholder.loadingBuilder,
            errorBuilder: BeImagePlaceholder.errorBuilder,
          ),
        ),
      ),
    );
  }
}
