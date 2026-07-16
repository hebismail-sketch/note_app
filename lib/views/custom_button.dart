import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.isLoading = false,
  });

  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,

        style: ElevatedButton.styleFrom(
          backgroundColor: isDark
              ? const Color(0xffE2CEA3)
              : const Color(0xff2B2B2B),

          foregroundColor: isDark
              ? Colors.black
              : Colors.white,

          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),

          child: isLoading
              ? const SizedBox(
            key: ValueKey("loading"),
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: Colors.white,
            ),
          )
              : const Text(
            "Save Note",
            key: ValueKey("text"),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
            ),
          ),
        ),
      ),
    );
  }
}