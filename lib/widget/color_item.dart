import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
final bool isActive;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive ?  CircleAvatar(
      radius: 38,
      backgroundColor: color,
      child: CircleAvatar(
          backgroundColor:Colors.blue,
          radius: 33, )):
       CircleAvatar(
        backgroundColor:color,
        radius: 38,);


  }
}
