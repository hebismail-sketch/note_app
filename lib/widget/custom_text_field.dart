import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.maxLines,
    this.onSaved,
    this.onChanged, required this.fontSize, this.controller,
  });

  final String hint;
  final int maxLines;
  final double fontSize;
  final TextEditingController?controller;
  final void Function(String?)? onSaved;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: Theme.of(context).colorScheme.primary,
      maxLines: maxLines,
      style: TextStyle(color:
        Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: fontSize,
      ),
      decoration: InputDecoration(
        hintText: hint,

        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: fontSize,
        ),

        contentPadding: EdgeInsets.zero,

        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
