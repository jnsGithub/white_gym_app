import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/modules/payment/controllers/payment_detail_controller.dart';
import 'package:white_gym/app/modules/payment/controllers/payment_success_controller..dart';
import 'package:white_gym/global.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';

class PaymentSuccessView extends GetView<PaymentSuccessController> {
  const PaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PaymentSuccessController());
    Size size = MediaQuery.of(context).size;
    double widthScale = size.width / baseWidth;
    double heightScale = size.height / baseHeight;
    int count = 0;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 98 * heightScale,),
            Image.asset(
              'image/logo_text.png',
              width: 157 * widthScale,
              height: 22.5 * heightScale,
            ),
            SizedBox(height: 130 * heightScale,),
            Image.asset(
              'image/success.png',
              width: 68 * widthScale,
              height: 68 * heightScale,
            ),
            SizedBox(height: 24 * heightScale),
            Text(
              '감사합니다!',
              style: TextStyle(fontSize: 18 * widthScale, color: mainColor, fontWeight: FontWeight.w500, letterSpacing: -1),
            ),
            SizedBox(height: 10),
            Text(
              '이용권 구매가 완료되었습니다',
              style: TextStyle(fontSize: 22 * widthScale, color: Colors.black, fontWeight: FontWeight.w600, letterSpacing: -1),
            ),
            SizedBox(height: 104 * heightScale,),
            GestureDetector(
              onTap: (){
                count++;
                print(count);
                Get.toNamed(Routes.OT, arguments: controller.spotDocumentId);
              },
                child: Image.asset('image/coupon.png', width: 335 * widthScale, height: 220 * heightScale,)
            ),
            SizedBox(height: 10 * heightScale,),
            GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.MAIN_HOME);
                },
                child: Text('다음에 하기', style: TextStyle(fontSize: 15, color: gray500, fontWeight: FontWeight.w600, decoration: TextDecoration.underline),))
          ],
        ),
      ),
    );
  }
}
