import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceptOrderDialog {
  const AcceptOrderDialog();

  static const List<(String, int)> _times = [
    ('30 мин', 30),
    ('1 час', 60),
    ('1 час 30 мин', 90),
    ('2 часа мин', 120),
    ('2 часа 30 мин', 150),
    ('3 часа', 180),
    ('3 часа 30 мин', 210),
    ('4 часа', 240),
  ];

  Future<int?> selectTime(
    BuildContext context,
  ) {
    final selectedTime = ValueNotifier<int>(0);

    return BeBottomDialog.showBottomDialog<int?>(
      context: context,
      maxChildSize: 0.90,
      initialChildSize: 0.90,
      minChildSize: 0.85,
      builder: (BuildContext context, ScrollController controller) {
        return BeDialogBody.builder(
          controller: controller,
          action: Column(
            children: [
              BeButton(
                text: 'Сохранить',
                color: .primary,
                variant: .solid,
                onPressed: () => context.pop(selectedTime.value),
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
          text: 'Время',
          builder: (BuildContext context, ScrollController? controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'Укажите время через кооторое вы будете уклиента.',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: .w500,
                      color: BeColors.surface5,
                    ),
                  ),
                  BeSpace(size: .md),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: selectedTime,
                      builder:
                          (BuildContext context, int value, Widget? child) {
                            return ListView.separated(
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                final time = _times[index];

                                return CheckListTile(
                                  isSelected: value == time.$2,
                                  title: time.$1,
                                  onTap: () => selectedTime.value = time.$2,
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                    return BeSpace(size: .xxl);
                                  },
                              itemCount: _times.length,
                            );
                          },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
