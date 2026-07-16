import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key,required this.icon, this.onPressed});
final IconData icon;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child:IconButton(onPressed: onPressed,
        icon: Icon(icon,
          size: 26,
        ),
      ),
    );
  }
}