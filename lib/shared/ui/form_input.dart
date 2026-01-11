import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_cargo/shared/ui/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BeFormInput extends StatelessWidget {
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool autofocus;
  final int? maxLength;

  late final TextEditingController controller;
  late final FocusNode focusNode;

  BeFormInput({
    super.key,
    this.inputFormatters,
    this.validator,
    this.label,
    this.autofocus = false,
    this.keyboardType,
    this.maxLength,
    TextEditingController? controller,
    FocusNode? focusNode,
  }) {
    this.focusNode = focusNode ?? FocusNode();
    this.controller = controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!focusNode.hasFocus) {
          focusNode.requestFocus();
        }
      },
      child: Stack(
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: BeColors.white,
            ),
          ),
          if (label != null)
            ListenableBuilder(
              listenable: focusNode,
              builder: (context, child) {
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
