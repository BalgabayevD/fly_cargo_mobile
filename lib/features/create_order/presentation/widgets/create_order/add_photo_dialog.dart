import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoDialog {
  const AddPhotoDialog();

  Future<ImageSource?> open(BuildContext context) {
    return BeBottomDialog.showBottomDialog<ImageSource?>(
      context: context,
      text: 'Источник',
      children: [
        BeButton(
          text: 'Камера',
          color: .gray,
          startContent: HeroIcon(
            HeroIcons.camera,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context, ImageSource.camera);
          },
        ),
        BeSpace(size: .md),
        BeButton(
          text: 'Галерея',
          color: .gray,
          startContent: HeroIcon(
            HeroIcons.photo,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context, ImageSource.gallery);
          },
        ),
      ],
    );
  }
}
