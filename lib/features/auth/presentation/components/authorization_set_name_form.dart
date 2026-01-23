import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorizationSetNameForm extends StatefulWidget {
  final bool isLoading;
  final FutureOr<void> Function(String name) onSubmit;

  const AuthorizationSetNameForm({
    required this.isLoading,
    required this.onSubmit,
    super.key,
  });

  @override
  State<AuthorizationSetNameForm> createState() =>
      _AuthorizationSetNameFormState();
}

class _AuthorizationSetNameFormState extends State<AuthorizationSetNameForm> {
  final TextEditingController codeController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    codeController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: .start,
        children: <Widget>[
          SizedBox(height: 24),
          Text(
            'Регистрация',
            style: GoogleFonts.montserrat(
              fontWeight: .w700,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 21),
          Text(
            'Укажите имя пользователя',
            style: GoogleFonts.montserrat(
              fontWeight: .w600,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 48),
          BeFormInput(
            autofocus: true,
            controller: codeController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Нужно заполнить поле';
              }
              return 'Проверьте код';
            },
            label: 'Имя',
          ),
          SizedBox(height: 24),
          BeButton(
            text: "Сохранить",
            isLoading: widget.isLoading,
            onPressed: () {
              if (codeController.text.length > 3) {
                widget.onSubmit(codeController.text);
                _focusNode.unfocus();
              }
            },
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
