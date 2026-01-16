import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/photos_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/add_photo_dialog.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/order_photo_button.dart';

class EditPhoto extends StatelessWidget {
  final OrderPhoto photo;
  final AddPhotoDialog dialog;

  const EditPhoto({required this.photo, super.key})
    : dialog = const AddPhotoDialog();

  Future<void> onTap(BuildContext context) async {
    final viewType = await dialog.openPhoto(context, photo);
    if (viewType == ViewType.delete && context.mounted) {
      context.read<PhotosBloc>().add(RemovePhotoEvent(photo));
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrderPhotoButton(photo: photo, onTap: () => onTap(context));
  }
}
