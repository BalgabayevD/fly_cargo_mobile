import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class AddPhotoButton extends StatelessWidget {
  final VoidCallback? onTap;

  const AddPhotoButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 164,
        width: 120,
        decoration: BoxDecoration(
          color: BeColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: BeColors.white,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroIcon(
              HeroIcons.camera,
              color: BeColors.surface4,
            ),
            BeSpace(size: .sm),
            Text(
              context.l10n.addPhoto,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 13,
                color: BeColors.surface4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
