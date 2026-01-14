import 'package:flutter/material.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/add_photo.dart';

class PhotoGridSection extends StatelessWidget {
  const PhotoGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      child: ListView(
        scrollDirection: .horizontal,
        children: [
          AddPhoto(),
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
