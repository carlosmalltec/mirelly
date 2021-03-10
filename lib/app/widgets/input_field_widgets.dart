import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldWidgets extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final String errorText;
  final String hintText;
  final Function onChanged;
  final TextInputType type;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;

  InputFieldWidgets(
      {this.controller,
      this.enabled = false,
      this.errorText = null,
      this.hintText,
      this.onChanged,
      this.type = TextInputType.text,
      this.maxLength,
      this.inputFormatters,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          enabled: enabled,
          border: const OutlineInputBorder(),
          isDense: true,
          hintText: hintText,
          errorText: errorText),
      keyboardType: type,
      onChanged: onChanged,
      maxLength: maxLength,
    );
  }
}
