import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmOtpForm extends StatefulWidget {
  final bool isLoading;
  final String phone;
  final FutureOr<void> Function(String phone) onSubmit;
  final FutureOr<void> Function() resend;

  const ConfirmOtpForm({
    required this.isLoading,
    required this.onSubmit,
    required this.phone,
    required this.resend,
    super.key,
  });

  @override
  State<ConfirmOtpForm> createState() => _ConfirmOtpFormState();
}

class _ConfirmOtpFormState extends State<ConfirmOtpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool isCanResend = false;
  int seconds = 120;

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Timer? timer;

  void startTimer() {
    timer?.cancel();

    // timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
    //   if (seconds > 0) {
    //     setState(() {
    //       seconds--;
    //     });
    //   } else {
    //     setState(() {
    //       seconds = 120;
    //       isCanResend = true;
    //     });
    //     t.cancel();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: .start,
          children: <Widget>[
            SizedBox(height: 24),
            Text(
              'СМС код',
              style: GoogleFonts.montserrat(
                fontWeight: .w700,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 21),
            Text(
              'Мы отправили 6 значный код по смс на номер ${widget.phone}',
              style: GoogleFonts.montserrat(
                fontWeight: .w600,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 48),
            BeFormInput(
              autofocus: true,
              controller: codeController,
              keyboardType: .number,
              validator: (value) {
                if (value != null && value.length == 6) return null;
                if (value != null && value.isEmpty) {
                  return 'Нужно заполнить поле';
                }
                return 'Проверьте код';
              },
              label: 'Код',
            ),
            SizedBox(height: 24),
            BeButton(
              text: 'Отправить',
              isLoading: widget.isLoading,
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  widget.onSubmit(codeController.text);
                  _focusNode.unfocus();
                }
              },
            ),
            SizedBox(height: 24),
            // BeButton(
            //   variant: .flat,
            //   text: isCanResend
            //       ? "Отправить код повторно"
            //       : "Повторный код через $seconds сек",
            //   isLoading: widget.isLoading,
            //   onPressed: isCanResend ? widget.resend : null,
            // ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
