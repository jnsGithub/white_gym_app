import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/global.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../controllers/ot_controller.dart';

class OtSuccessView extends GetView<OtController> {
  const OtSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int count = 0;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.064,),
              Image.asset(
                'image/logo_text.png',
                width: size.width * 0.4187,
                height: size.height * 0.0278,
              ),
              SizedBox(height: 97.35,),
              Text(
                'OT 신청 완료!',
                style: TextStyle(fontSize: size.width * 0.0693, color: gray900, fontWeight: FontWeight.w600, letterSpacing: -1),
              ),
              SizedBox(height: 34),
              Text('신청이 완료되었어요!\n적합한 트레이너가 배정되 나면 연락드릴게요.', style: TextStyle(fontSize: size.width * 0.0373, color: gray500, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
              SizedBox(height: 16,),
              Image.asset(
                'image/good.png',
                width: size.width * 0.64,
                height: size.width * 0.64,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10),
            maximumSize: Size(size.width * 0.8933, 50),
            minimumSize: Size(size.width * 0.8933, 50),
            backgroundColor: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
            onPressed: (){
            Get.offAllNamed(Routes.MAIN_HOME);
            },
            child: Text('확인', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)
        )
      ),
    );
  }
}
