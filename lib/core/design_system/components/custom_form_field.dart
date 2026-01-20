import 'package:flutter/material.dart';

class CustomFormField<T> extends FormField<T> {
  CustomFormField({
    super.key,
    required T initialValue,
    required Widget Function(
      T value,
      ValueChanged<T> onChanged,
      bool hasError,
      String? errorText,
    )
    builder,
    FormFieldValidator<T>? validator,
    ValueChanged<T?>? onSaved,
    AutovalidateMode? autovalidateMode,
  }) : super(
         initialValue: initialValue,
         validator: validator,
         autovalidateMode: autovalidateMode,
         onSaved: onSaved,
         builder: (FormFieldState<T> state) {
           return builder(
             state.value as T,
             (T newValue) => state.didChange(newValue),
             state.hasError,
             state.errorText,
           );
         },
       );
}
