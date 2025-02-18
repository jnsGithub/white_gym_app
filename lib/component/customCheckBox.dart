import 'package:flutter/material.dart';
import 'package:white_gym/global.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final double size;
  final Color borderColor;
  final Color fillColor;
  final bool allCheck;

  const CustomCheckbox({
    Key? key,
    required this.isChecked,
    required this.allCheck,
    this.size = 24.0,
    this.borderColor = Colors.blue,
    this.fillColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: allCheck?BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isChecked ? mainColor : Color(0xffD1D7E4),
      ):null,
      child: allCheck ? Icon(Icons.check, color: Colors.white, size: size * 0.8):
      Icon(Icons.check, color:isChecked?mainColor: Color(0xffD1D7E4), size: size * 0.8)
    );
  }
}
