import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';

class AddressSelectField extends StatefulWidget {
  final String? label;
  final String? value;
  final bool readOnly;
  final bool autofocus;
  final bool autoSelect;
  final List<String>? completions;

  const AddressSelectField({
    super.key,
    this.label,
    this.value,
    this.readOnly = false,
    this.autofocus = false,
    this.autoSelect = false,
    this.completions = const [],
  });

  @override
  State<AddressSelectField> createState() => _AddressSelectFieldState();
}

class _AddressSelectFieldState extends State<AddressSelectField> {
  bool isFocused = false;
  final focusNode = FocusNode();
  final controller = TextEditingController();

  @override
  void initState() {
    if (widget.value != null) {
      controller.text = widget.value!;
    }
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BeFormInput(
          readOnly: widget.readOnly,
          controller: controller,
          autofocus: widget.autofocus,
          variant: .bordered,
          focusNode: focusNode,
          label: widget.label,
        ),
        if (focusNode.hasFocus)
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: widget.completions!.length,
            itemBuilder: (BuildContext context, int index) {
              return LightListTile(
                title: widget.completions![index],
                onTap: () {
                  controller.text = widget.completions![index];

                  if (widget.autoSelect) {
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
      ],
    );
  }
}
