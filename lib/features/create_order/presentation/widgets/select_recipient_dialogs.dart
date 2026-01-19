import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/enitites/recipient_entity.dart';
import 'package:fly_cargo/features/create_order/presentation/notifier/recipient_notifier.dart';
import 'package:go_router/go_router.dart';

class SelectRecipientDialogs {
  const SelectRecipientDialogs();

  Future<RecipientEntity?> toSelectRecipient(
    BuildContext context,
    String text,
    RecipientEntity recipient,
  ) {
    RecipientNotifier notifier = RecipientNotifier(recipient: recipient);

    return BeBottomDialog.showBottomDialog<RecipientEntity?>(
      context: context,
      maxChildSize: 0.90,
      initialChildSize: 0.90,
      minChildSize: 0.85,
      text: text,
      builder: (BuildContext context, ScrollController controller) {
        return ListenableBuilder(
          listenable: notifier,
          builder: (BuildContext context, Widget? child) {
            return BeDialogBody(
              controller: controller,
              text: context.l10n.recipient,
              action: BeButton(
                text: 'Сохранить',
                onPressed: () => context.pop(notifier.recipient),
              ),
              children: [
                _DialogNameSelect(notifier: notifier),
                BeSpace(size: .md),
                _DialogPhoneSelect(notifier: notifier),
              ],
            );
          },
        );
      },
    );
  }
}

class _DialogNameSelect extends StatefulWidget {
  final RecipientNotifier notifier;

  const _DialogNameSelect({required this.notifier});

  @override
  State<_DialogNameSelect> createState() => _DialogNameSelectState();
}

class _DialogNameSelectState extends State<_DialogNameSelect> {
  late final textController = TextEditingController(
    text: widget.notifier.recipient.name,
  );
  late final FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    textController.addListener(() {
      widget.notifier.setName(textController.text);
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.notifier,
      builder: (BuildContext context, Widget? child) {
        return BeFormInput(
          focusNode: focusNode,
          variant: .bordered,
          label: context.l10n.recipientName,
          controller: textController,
        );
      },
    );
  }
}

class _DialogPhoneSelect extends StatefulWidget {
  final RecipientNotifier notifier;

  const _DialogPhoneSelect({required this.notifier});

  @override
  State<_DialogPhoneSelect> createState() => _DialogPhoneSelectState();
}

class _DialogPhoneSelectState extends State<_DialogPhoneSelect> {
  late final FocusNode focusNode;
  late final textController = TextEditingController(
    text: widget.notifier.recipient.phone,
  );
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    textController.addListener(() {
      widget.notifier.setPhone(textController.text);
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.notifier,
      builder: (BuildContext context, Widget? child) {
        return BeFormInput(
          focusNode: focusNode,
          variant: .bordered,
          keyboardType: .phone,
          validator: (value) {
            if (value != null && value.length == 17) return null;
            if (value != null && value.isEmpty) {
              return 'Нужно заполнить поле';
            }
            return 'Проверьте номер телефона';
          },
          inputFormatters: [PhoneInputFormatter(allowEndlessPhone: false)],
          label: context.l10n.recipientPhone,
          controller: textController,
        );
      },
    );
  }
}
