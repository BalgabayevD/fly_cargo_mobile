import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/photo_square_card.dart';

class PhotoGridSection extends StatelessWidget {
  final List<File> photos;
  final VoidCallback onPickPhoto;
  final Function(File) onRemovePhoto;

  const PhotoGridSection({
    required this.photos,
    required this.onPickPhoto,
    required this.onRemovePhoto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PhotoSquareCard(
            photo: photos.isNotEmpty ? photos[0] : null,
            onTap: onPickPhoto,
            onRemove: photos.isNotEmpty ? () => onRemovePhoto(photos[0]) : null,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: PhotoSquareCard(
            photo: photos.length > 1 ? photos[1] : null,
            onTap: onPickPhoto,
            onRemove: photos.length > 1 ? () => onRemovePhoto(photos[1]) : null,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: PhotoSquareCard(
            photo: photos.length > 2 ? photos[2] : null,
            onTap: onPickPhoto,
            onRemove: photos.length > 2 ? () => onRemovePhoto(photos[2]) : null,
          ),
        ),
      ],
    );
  }
}

