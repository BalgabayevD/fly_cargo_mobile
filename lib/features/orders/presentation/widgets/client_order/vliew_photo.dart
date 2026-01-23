import 'package:flutter/material.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/client_order/order_photo_view_button.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/client_order/order_view_photo_dialog.dart';

class ViewPhoto extends StatelessWidget {
  final String photo;
  final ViewPhotoDialog dialog;

  const ViewPhoto({required this.photo, super.key})
    : dialog = const ViewPhotoDialog();

  Future<void> onTap(BuildContext context) async {
    await dialog.openPhoto(context, photo);
  }

  @override
  Widget build(BuildContext context) {
    return OrderPhotoViewButton(photo: photo, onTap: () => onTap(context));
  }
}
