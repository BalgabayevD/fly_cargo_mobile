import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo_entity.dart';

class OrderPhotoButton extends StatelessWidget {
  final OrderPhotoEntity photo;
  final VoidCallback? onTap;
  final double height;
  final double width;

  const OrderPhotoButton({
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
          child: Stack(
            children: [
              Image.file(
                photo.file,
                height: height,
                width: width,
                fit: .cover,
                errorBuilder: (BuildContext context, _, __) {
                  return const Icon(Icons.error);
                },
              ),
              if (photo.isUploading)
                Container(
                  color: BeColors.white.withAlpha(75),
                ),
              if (photo.isUploading)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
