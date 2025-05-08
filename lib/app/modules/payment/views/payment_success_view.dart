import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/global.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

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
              SizedBox(height: size.height * 0.1151,),
              Image.asset(
                'image/success.png',
                width: size.width * 0.2667,
                height: size.height * 0.1232,
              ),
              SizedBox(height: size.height * 0.0296),
              Text(
                '감사합니다!',
                style: TextStyle(fontSize: size.width * 0.048, color: mainColor, fontWeight: FontWeight.w500, letterSpacing: -1),
              ),
              SizedBox(height: size.height * 0.0123),
              Text(
                '이용권 구매가 완료되었습니다',
                style: TextStyle(fontSize: size.width * 0.059, color: Colors.black, fontWeight: FontWeight.w600, letterSpacing: -1),
              ),
              SizedBox(height: size.height * 0.1281,),
              GestureDetector(
                onTap: (){
                  count++;
                  print(count);
                  Get.toNamed(Routes.OT);
                },
                  child: Image.asset('image/coupon.png', width: size.width * 0.8933, height: size.height * 0.2709,)
              ),
              SizedBox(height: size.height * 0.0179,),
              TextButton(
                  onPressed: (){
                    Get.offAllNamed(autoLogin);
                  },
                  child: Text('다음에 하기', style: TextStyle(fontSize: size.width * 0.04, color: gray500, fontWeight: FontWeight.w600, decoration: TextDecoration.underline),))
            ],
          ),
        ),
      ),
    );
  }
}
