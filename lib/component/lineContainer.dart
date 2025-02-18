import 'package:flutter/material.dart';

import '../global.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: 18),
      height: 8,
      alignment: Alignment.center,
      decoration: BoxDecoration(
         color: Color(0xffF4F5F7)
      ),
    );
  }
}
