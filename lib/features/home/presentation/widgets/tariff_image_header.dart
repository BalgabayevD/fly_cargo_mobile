import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class TariffImageHeader extends StatelessWidget {
  final String imageUrl;

  const TariffImageHeader({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: AppColors.gray50,
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const _PlaceholderIcon();
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
            )
          : const _PlaceholderIcon(),
    );
  }
}

class _PlaceholderIcon extends StatelessWidget {
  const _PlaceholderIcon();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.local_shipping,
        size: 60,
        color: AppColors.textSecondary,
      ),
    );
  }
}
