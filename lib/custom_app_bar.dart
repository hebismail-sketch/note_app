import 'package:flutter/material.dart';
import 'package:note_app/widget/theme_switch.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        const ThemeSwitch(),
      ],
    );
  }
}