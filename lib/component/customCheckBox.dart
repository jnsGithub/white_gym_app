import 'package:flutter/material.dart';
import 'package:white_gym/global.dart';

class CustomCheckbox extends StatelessWidget {
  bool isChecked;
  final double size;
  final Color borderColor;
  final Color fillColor;
  final bool allCheck;
  bool isOneDay;
  bool? isLocker;

  CustomCheckbox({
    Key? key,
    required this.isChecked,
    required this.allCheck,
    this.size = 24.0,
    this.borderColor = Colors.blue,
    this.fillColor = Colors.blue,
    this.isOneDay = false,
    this.isLocker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isLocker != null && isLocker == true && isOneDay == true) {
      isOneDay = false;
      isChecked = false;
    }
    return Container(
      width: size,
      height: size,
      decoration: allCheck ? BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isOneDay || isChecked
            ? mainColor
            : Color(0xffD1D7E4),
      ):null,
      child: allCheck
          ? Icon(Icons.check,
          color: Colors.white,
          size: size * 0.8)
          : Icon(
          Icons.check,
          color: isChecked
              ? mainColor
              : Color(0xffD1D7E4),
          size: size * 0.8)
    );
  }
}
