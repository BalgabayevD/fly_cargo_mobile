import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo_entity.dart';
import 'package:go_router/go_router.dart';

class ClientOrderPayDialog {
  const ClientOrderPayDialog();

  Future<ViewType?> selectCards(
    BuildContext context,
    int orderId,
    double payAmount,
  ) {
    ValueNotifier<int> notifier = ValueNotifier(0);

    return BeBottomDialog.showBottomDialog<ViewType?>(
      context: context,
      maxChildSize: 0.90,
      initialChildSize: 0.90,
      minChildSize: 0.85,
      builder: (BuildContext context, ScrollController controller) {
        return BeDialogBody.builder(
          controller: controller,
          text: 'Оплата заказа №$orderId',
          builder: (BuildContext context, ScrollController? controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text('1'),
                    ),
                  ),
                  BeSpace(size: .xxl),
                  BeButton(
                    text: 'Оплатить $payAmount тг',
                    color: .primary,
                    onPressed: () {
                      context.pop(ViewType.close);
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

// class _DialogCardSelect extends StatelessWidget {
//   final ScrollController controller;
//   final ValueNotifier<int> notifier;
//
//   const _DialogCardSelect({
//     required this.notifier,
//     required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: notifier,
//       builder: (BuildContext context, int value, Widget? child) {
//         return BeDialogBody(
//           controller: controller,
//           titleVariant: .secondary,
//           text: context.l10n.city,
//           action: BeButton(
//             text: 'Сохранить',
//             onPressed: () {
//               notifier.value = 1;
//               context.pop();
//             },
//           ),
//           children: local.locations.cities.map((city) {
//             return CheckListTile(
//               title: city.name,
//               isSelected: local.locations.selectedCityId == city.id,
//               onTap: () => local.selectCity(city.id),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
