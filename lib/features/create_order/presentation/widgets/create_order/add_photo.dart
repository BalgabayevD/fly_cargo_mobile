import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/add_photo_button.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/add_photo_dialog.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto extends StatelessWidget {
  final ImagePicker imagePicker;
  final AddPhotoDialog dialog;

  AddPhoto({super.key})
    : imagePicker = ImagePicker(),
      dialog = const AddPhotoDialog();

  Future<void> onTap(BuildContext context) async {
    final source = await dialog.open(context);

    if (source != null) {
      final image = await imagePicker.pickImage(source: source);

      if (image != null) {
        final file = File(image.path);

        final orderPhoto = OrderPhoto(file: file);
        print(orderPhoto);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AddPhotoButton(onTap: () => onTap(context));
  }
}
