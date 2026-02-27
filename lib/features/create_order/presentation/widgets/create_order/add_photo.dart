import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/photos_bloc.dart';
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
    try {
      ImageSource? source = ImageSource.camera;

      if (kDebugMode) {
        source = await dialog.open(context);
      }

      if (source != null) {
        final image = await imagePicker.pickImage(source: source);

        if (image != null && context.mounted) {
          final file = File(image.path);

          context.read<PhotosBloc>().add(PickPhotoEvent(file));
        }
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return AddPhotoButton(onTap: () => onTap(context));
  }
}
