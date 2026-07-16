import 'package:flutter/material.dart';

class NoteCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // البداية
    path.moveTo(0, 18);

    // الركن العلوي الشمال
    path.quadraticBezierTo(0, 0, 18, 0);

    // أعلى الكارت
    path.lineTo(size.width - 18, 0);

    // الركن العلوي اليمين
    path.quadraticBezierTo(
      size.width,
      0,
      size.width,
      18,
    );

    // نزول الجانب اليمين
    path.lineTo(size.width - 20, size.height);

    // أسفل الكارت
    path.lineTo(20, size.height);

    // طلوع الجانب الشمال
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}