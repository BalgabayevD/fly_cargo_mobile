import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo_entity.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/client_order/order_photo_view_button.dart';
import 'package:go_router/go_router.dart';

class ViewPhotoDialog {
  const ViewPhotoDialog();

  Future<ViewType?> openPhoto(
    BuildContext context,
    String photo,
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
                      child: OrderPhotoViewButton(
                        photo: photo,
                        width: 226,
                        height: 382,
                      ),
                    ),
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
