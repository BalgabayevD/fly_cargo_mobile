import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/payments/domain/entities/card_entity.dart';
import 'package:go_router/go_router.dart';

enum ClientOrderPayAction {
  pay,
  close,
}

class ClientOrderPayDialog {
  const ClientOrderPayDialog();

  Future<(ClientOrderPayAction, int)?> selectCards(
    BuildContext context,
    List<CardEntity> cards,
    int orderId,
    double payAmount,
  ) {
    ValueNotifier<int> notifier = ValueNotifier(
      cards.isNotEmpty ? cards.first.id : 0,
    );

    return BeBottomDialog.showBottomDialog<(ClientOrderPayAction, int)?>(
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
              child: ValueListenableBuilder<int>(
                valueListenable: notifier,
                builder: (BuildContext context, int value, Widget? child) {
                  return Column(
                    children: [
                      if (cards.isNotEmpty)
                        ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: cards.map((card) {
                            return CheckListTile(
                              image: Image.network(
                                card.image,
                              ),
                              title: card.mask,
                              description: '${card.type} ${card.bank}',
                              isSelected: value == card.id,
                              onTap: () {
                                notifier.value = card.id;
                              },
                            );
                          }).toList(),
                        ),
                      Spacer(),
                      BeSpace(size: .xxl),
                      if (cards.isNotEmpty)
                        BeButton(
                          text: 'Оплатить $payAmount тг',
                          color: .primary,
                          onPressed: () {
                            context.pop((
                              ClientOrderPayAction.pay,
                              notifier.value,
                            ));
                          },
                        ),
                      BeSpace(size: .xxl),
                      BeButton(
                        text: 'Назад',
                        color: .gray,
                        onPressed: () {
                          context.pop((ClientOrderPayAction.close, 0));
                        },
                      ),
                      BeSpace(size: .xxl),
                      BeSpace(size: .xxl),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
