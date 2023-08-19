import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomField extends StatelessWidget {
  final String labelText;
  final Function onChanged;
  bool? autoFocus;
  TextInputType? keyboardType;
  String? initialValue;
  String? Function(String?) validator;

  CustomField({required this.labelText, required this.onChanged, this.keyboardType, this.autoFocus, this.initialValue, required this.validator , Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType ?? TextInputType.text,
      autofocus: autoFocus ?? false,
      onChanged: (value) {
        onChanged(value);
      },
      validator: validator,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}