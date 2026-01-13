import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/create_order/domain/usecases/upload_order_photo_usecase.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_order_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_order_event.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';

mixin PhotoHandlerMixin<T extends StatefulWidget> on State<T> {
  UploadOrderPhotoUseCase get uploadOrderPhotoUseCase;
  List<File> get photos;
  Map<File, String> get photoIds;
  bool get isAnalyzing;

  void addPhoto(File photo);
  void removePhotoFromList(File photo);
  void removePhotoId(File photo);
  void setAnalyzing(bool value);

  Future<void> pickPhoto() async {
    final source = await BeBottomDialog.showBottomDialog(
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

    if (source == null) return;

    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      final photoFile = File(image.path);
      addPhoto(photoFile);

      try {
        final photoId = await uploadOrderPhotoUseCase(photoFile);
        photoIds[photoFile] = photoId;

        if (!isAnalyzing) {
          startAutoAnalysis();
        }
      } catch (e) {
        removePhotoFromList(photoFile);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ошибка при загрузке фото: $e'),
              backgroundColor: AppColors.danger,
            ),
          );
        }
      }
    }
  }

  void removePhoto(File photo) {
    removePhotoFromList(photo);
    removePhotoId(photo);
  }

  Future<void> startAutoAnalysis() async {
    if (photos.isEmpty) return;

    setAnalyzing(true);
    print('🚀 Запускаем анализ с ${photos.length} фото');

    context.read<CreateOrderBloc>().add(
      PreCreateOrderEvent(images: photos),
    );
  }
}
