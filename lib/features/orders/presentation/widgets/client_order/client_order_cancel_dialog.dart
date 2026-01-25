import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/orders/presentation/pages/cancel_reason_page.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

enum ClientOrderCancelAction {
  cancel,
  close,
}

class ClientOrderCancelDialog {
  const ClientOrderCancelDialog();

  Future<ClientOrderCancelAction?> show(
    BuildContext context, {
    required int orderId,
    required int cancelType,
    required double cancelAmount,
  }) {
    final isFree = cancelType == 1;

    return BeBottomDialog.showBottomDialog<ClientOrderCancelAction?>(
      context: context,
      maxChildSize: 0.80,
      initialChildSize: 0.80,
      minChildSize: 0.70,
      builder: (BuildContext context, ScrollController controller) {
        return BeDialogBody.builder(
          controller: controller,
          text: '',
          builder: (BuildContext context, ScrollController? controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  BeSpace(size: .xl),
                  HeroIcon(
                    HeroIcons.informationCircle,
                    color: BeColors.danger,
                    size: 120,
                  ),
                  BeSpace(size: .xl),
                  Text(
                    'Отмена',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: BeColors.surface5,
                    ),
                  ),
                  BeSpace(size: .xxl),
                  Text(
                    'Заказ будет отменен',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: BeColors.surface5,
                    ),
                  ),
                  Spacer(),
                  if (!isFree)
                    GestureDetector(
                      onTap: () => context.push(CancelReasonPage.location()),
                      child: Text(
                        'Почему отмена платная?',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: BeColors.primary,
                        ),
                      ),
                    ),
                  if (!isFree) BeSpace(size: .xl),
                  if (!isFree) BeSpace(size: .xl),
                  if (!isFree) BeSpace(size: .xs),
                  BeButton(
                    text: isFree
                        ? 'Отменить заказ'
                        : 'Отменить за ${cancelAmount.toInt()} тг',
                    variant: .flat,
                    color: .danger,
                    onPressed: () {
                      context.pop(ClientOrderCancelAction.cancel);
                    },
                  ),
                  BeSpace(size: .xxl),
                  BeButton(
                    text: 'Назад',
                    variant: .flat,
                    color: .gray,
                    onPressed: () {
                      context.pop(ClientOrderCancelAction.close);
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

  Future<void> cancelSuccessStatus(BuildContext context) {
    return BeBottomDialog.showBottomDialog(
      context: context,
      maxChildSize: 0.60,
      initialChildSize: 0.60,
      minChildSize: 0.50,
      builder: (BuildContext context, ScrollController controller) {
        return BeDialogBody.builder(
          controller: controller,
          text: '',
          builder: (BuildContext context, ScrollController? controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  BeSpace(size: .xxl),
                  HeroIcon(
                    HeroIcons.checkBadge,
                    color: BeColors.success,
                    size: 120,
                  ),
                  BeSpace(size: .xxl),
                  Text(
                    'Заказ отменен',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: BeColors.surface5,
                    ),
                  ),
                  Spacer(),
                  BeButton(
                    text: 'Закрыть',
                    variant: .flat,
                    color: .gray,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  BeSpace(size: .xxl),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<bool?> cancelFailureStatus(BuildContext context) {
    return BeBottomDialog.showBottomDialog<bool?>(
      context: context,
      maxChildSize: 0.60,
      initialChildSize: 0.60,
      minChildSize: 0.50,
      builder: (BuildContext context, ScrollController controller) {
        return BeDialogBody.builder(
          controller: controller,
          text: '',
          builder: (BuildContext context, ScrollController? controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  BeSpace(size: .xxl),
                  HeroIcon(
                    HeroIcons.exclamationTriangle,
                    color: BeColors.danger,
                    size: 120,
                  ),
                  BeSpace(size: .xxl),
                  Text(
                    'Ошибка',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: BeColors.surface5,
                    ),
                  ),
                  BeSpace(size: .md),
                  Text(
                    'Не удалось отменить заказ',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: BeColors.surface4,
                    ),
                  ),
                  Spacer(),
                  BeButton(
                    text: 'Повторить',
                    variant: .flat,
                    color: .danger,
                    onPressed: () {
                      context.pop(true);
                    },
                  ),
                  BeSpace(size: .md),
                  BeButton(
                    text: 'Закрыть',
                    variant: .flat,
                    color: .gray,
                    onPressed: () {
                      context.pop(false);
                    },
                  ),
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
