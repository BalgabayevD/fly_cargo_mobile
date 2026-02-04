import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DeclineOrderDialog {
  const DeclineOrderDialog();

  static const List<(String, String)> reasons = [
    ('Не правильно заполнен заказ', 'INCORRECT_DECLINE_REASON'),
    ('Запрещенный груз', 'DANGER_DECLINE_REASON'),
  ];

  Future<(String, String)?> reason(
    BuildContext context,
  ) {
    final selectedReason = ValueNotifier<String>(reasons.first.$2);
    final descirption = TextEditingController();
    final focusNode = FocusNode();

    return BeBottomDialog.showBottomDialog<(String, String)?>(
      context: context,
      maxChildSize: 0.90,
      initialChildSize: 0.90,
      minChildSize: 0.85,
      builder: (BuildContext context, ScrollController controller) {
        return BeDialogBody.builder(
          controller: controller,
          backgroundColor: BeColors.surface2,
          action: Column(
            children: [
              BeButton(
                text: 'Отклонить',
                color: .danger,
                variant: .solid,
                onPressed: () =>
                    context.pop((selectedReason.value, descirption.text)),
              ),
              BeSpace(size: .xxl),
              BeButton(
                text: 'Назад',
                color: .gray,
                variant: .solid,
                onPressed: () => context.pop(),
              ),
            ],
          ),
          text: 'Отклонить заказ',
          builder: (BuildContext context, ScrollController? controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                controller: controller,
                children: [
                  Text(
                    'Укажите почему вы отклоняете заказ',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: .w500,
                      color: BeColors.surface5,
                    ),
                  ),
                  BeSpace(size: .md),
                  BeFormInput(
                    label: 'Описание (не обязательно)',
                    controller: descirption,
                    focusNode: focusNode,
                  ),
                  BeSpace(size: .xxl),
                  ValueListenableBuilder(
                    valueListenable: selectedReason,
                    builder:
                        (BuildContext context, String value, Widget? child) {
                          return ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (BuildContext context, int index) {
                              final reason = reasons[index];

                              return CheckListTile(
                                isSelected: value == reason.$2,
                                title: reason.$1,
                                onTap: () => selectedReason.value = reason.$2,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                                  return BeSpace(size: .xxl);
                                },
                            itemCount: reasons.length,
                          );
                        },
                  ),
                  BeSpace(size: .xxxl),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
