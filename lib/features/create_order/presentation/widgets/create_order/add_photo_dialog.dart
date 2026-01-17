import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';

import 'order_photo_button.dart';

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
            context.pop(ImageSource.camera);
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
            context.pop(ImageSource.gallery);
          },
        ),
      ],
    );
  }

  Future<ViewType?> openPhoto(
    BuildContext context,
    OrderPhotoEntity photo,
  ) {
    return BeBottomDialog.showBottomDialog<ViewType?>(
      context: context,
      maxChildSize: 0.90,
      initialChildSize: 0.90,
      minChildSize: 0.85,
      builder: (BuildContext context, ScrollController controller) {
        return BeDialogBody.builder(
          controller: controller,
          text: '',
          builder: (BuildContext context, ScrollController? controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: OrderPhotoButton(
                        photo: photo,
                        width: 226,
                        height: 382,
                      ),
                    ),
                  ),
                  BeSpace(size: .xxl),
                  BeButton(
                    text: 'Удалить фото',
                    color: .danger,
                    variant: .light,
                    onPressed: () {
                      context.pop(ViewType.delete);
                    },
                  ),
                  BeSpace(size: .xxl),
                  BeButton(
                    text: 'Назад',
                    color: .gray,
                    onPressed: () {
                      context.pop(ViewType.close);
                    },
                  ),
                  BeSpace(size: .xxl),
                  BeSpace(size: .xxl),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
