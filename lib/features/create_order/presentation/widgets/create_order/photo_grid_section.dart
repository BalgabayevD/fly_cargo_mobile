import 'dart:io';

import 'package:flutter/material.dart';
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
    return SizedBox(
      height: 164,
      child: ListView(
        scrollDirection: .horizontal,
        children: [
          AddPhotoButton(),
          // const SizedBox(width: AppSpacing.md),
          // PhotoButton(),
          // const SizedBox(width: AppSpacing.md),
          // PhotoButton(),
          // const SizedBox(width: AppSpacing.md),
          // PhotoButton(),
          // const SizedBox(width: AppSpacing.md),
          // PhotoButton(),
          // const SizedBox(width: AppSpacing.md),
          // PhotoButton(),
        ],
      ),
    );
  }
}
