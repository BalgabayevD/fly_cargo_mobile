import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';

class PhotoSquareCard extends StatelessWidget {
  final File? photo;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const PhotoSquareCard({
    required this.onTap,
    this.photo,
    this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: photo == null ? onTap : null,
      child: AspectRatio(
        aspectRatio: 12 / 16,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
            border: Border.all(
              color: AppColors.surface2,
              width: 1,
            ),
          ),
          child: photo != null
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                      child: Image.file(
                        photo!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (onRemove != null)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: onRemove,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.danger.withOpacity(0.9),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 32,
                      color: AppColors.surface4,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      context.l10n.addPhoto,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.surface4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

