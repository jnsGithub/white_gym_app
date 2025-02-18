import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global.dart';
import '../main.dart';

class TextFieldComponent extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController controller;
  final bool multi;
  final bool typeNumber;
  final bool obscureText;
  final Color color;
  const TextFieldComponent({required this.obscureText,required this.text,required this.controller,required this.multi,required this.color, required this.typeNumber,super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        Text(text, style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black
        ),),
        const SizedBox(
          height: 9,
        ),
        Container(
          width: size.width,
         height:  multi ? null:50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xfff6f6fa)),
          child: TextField(
            controller: controller,
            maxLines: multi? 7:1,
            obscureText: obscureText,
            keyboardType: typeNumber? TextInputType.number:null,
            decoration:   InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffAEAEB2)),
              border: InputBorder.none,
              // 밑줄 없애기
              contentPadding:EdgeInsets.only(left: 20,top: multi?15:0),
              // TextField 내부의 패딩 적용
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: mainColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
