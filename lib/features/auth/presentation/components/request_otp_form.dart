import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestOtpForm extends StatefulWidget {
  final bool isLoading;
  final FutureOr<void> Function(String phone) onSubmit;

  const RequestOtpForm({
    required this.isLoading,
    required this.onSubmit,
    super.key,
  });

  @override
  State<RequestOtpForm> createState() => _RequestOtpFormState();
}

class _RequestOtpFormState extends State<RequestOtpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController(
    text: '+7',
  );
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
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
              'Номер телефона',
              style: GoogleFonts.montserrat(fontWeight: .w700, fontSize: 24),
            ),
            SizedBox(height: 21),
            Text(
              'Поможет создавать и отслеживать ваши заказы',
              style: GoogleFonts.montserrat(fontWeight: .w600, fontSize: 16),
            ),
            SizedBox(height: 48),
            BeFormInput(
              focusNode: FocusNode(),
              autofocus: !widget.isLoading,
              controller: _phoneController,
              keyboardType: .phone,
              validator: (value) {
                if (value != null && value.length == 17) return null;
                if (value != null && value.isEmpty) {
                  return 'Нужно заполнить поле';
                }
                return 'Проверьте номер телефона';
              },
              label: 'Номер телефона',
              inputFormatters: [PhoneInputFormatter(allowEndlessPhone: false)],
            ),
            SizedBox(height: 24),
            BeButton(
              text: 'Получить код',
              isLoading: widget.isLoading,
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  widget.onSubmit(_phoneController.text);
                  _focusNode.unfocus();
                }
              },
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
