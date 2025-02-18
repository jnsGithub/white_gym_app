import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/global.dart';

import '../../../../component/main_box.dart';
import '../../../routes/app_pages.dart';

class SignUpCompleted extends GetView {
  const SignUpCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('image/logo_text.png', width: 157),
        centerTitle: true,
        leading: Container(),
        leadingWidth: 0,
        ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 children: [
                   SizedBox(height: size.width*0.2249,),
                   Text('반갑습니다, 회원님!',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: mainColor),),
                   SizedBox(height: 4,),
                   Text('가입을 완료했습니다',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
                   SizedBox(height: 12,),
                   Image(image: AssetImage('image/signup.png'),width: size.width * 0.8907,),
                 ],
               ),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                   onTap: (){
                      Get.offAllNamed(Routes.GYM_LIST);
                   },
                     child: MainBox(text: '확인', color: mainColor, textColor: Colors.white,)
                 ),
               )
             ],
            ),
          )
      ),
    );
  }
}
