import 'package:flutter/material.dart';

OutlineInputBorder buildBorder({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: color ?? Colors.white,
    ),
  );
}