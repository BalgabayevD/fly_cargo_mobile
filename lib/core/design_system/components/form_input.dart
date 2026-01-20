import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:google_fonts/google_fonts.dart';

enum BeFormInputVariant {
  flat,
  bordered,
}

class BeFormInput extends StatelessWidget {
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final BeFormInputVariant variant;
  final bool autofocus;
  final bool readOnly;
  final int? maxLength;
  final List<String?> errors;

  late final TextEditingController controller;
  late final FocusNode focusNode;

  BeFormInput({
    super.key,
    this.inputFormatters,
    this.validator,
    this.label,
    this.autofocus = false,
    this.readOnly = false,
    this.keyboardType,
    this.maxLength,
    this.errors = const <String?>[],
    this.variant = .flat,
    TextEditingController? controller,
    FocusNode? focusNode,
  }) {
    this.focusNode = focusNode ?? FocusNode();
    this.controller = controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final anyError = errors.any((text) => text != null);
    final errorText = anyError
        ? errors.firstWhere((text) => text != null)
        : null;

    return GestureDetector(
      onTap: () {
        if (!focusNode.hasFocus) {
          focusNode.requestFocus();
        }
      },
      child: Stack(
        children: [
          Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: errorText != null
                        ? BeColors.danger
                        : variant == .bordered
                        ? BeColors.border
                        : BeColors.white,
                  ),
                  color: BeColors.white,
                ),
              ),
              if (errorText != null)
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 4),
                  child: Text(
                    errorText,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      height: 1,
                      fontWeight: .w600,
                      color: BeColors.danger,
                    ),
                  ),
                ),
            ],
          ),
          if (label != null)
            ListenableBuilder(
              listenable: focusNode,
              builder: (BuildContext context, child) {
                final isBlank = controller.text.isEmpty && !focusNode.hasFocus;

                return ListenableBuilder(
                  listenable: controller,
                  builder: (context, child) {
                    return AnimatedPositioned(
                      duration: Duration(microseconds: 100),
                      left: 16,
                      top: isBlank ? 25 : 14,
                      child: Text(
                        label!,
                        style: GoogleFonts.montserrat(
                          fontSize: isBlank ? 17 : 13,
                          fontWeight: .w600,
                          color: focusNode.hasFocus
                              ? BeColors.primary
                              : BeColors.surface3,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          Container(
            height: 70,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(
              left: 12,
              top: 34,
              right: 12,
              bottom: 10,
            ),
            child: TextFormField(
              controller: controller,
              autofocus: autofocus,
              readOnly: readOnly,
              focusNode: focusNode,
              keyboardType: keyboardType,
              validator: validator,
              maxLength: maxLength,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                errorStyle: TextStyle(height: 0, fontSize: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
