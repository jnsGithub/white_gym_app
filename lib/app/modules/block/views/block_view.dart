import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global.dart';
import '../controllers/block_controller.dart';

class BlockView extends GetView<BlockController> {
  const BlockView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BlockController());
    Size size = MediaQuery.of(context).size;
    double scaleWidth = size.width / 375;
    double scaleHeight = size.height / 812;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('image/logo_text.png', width: 157 * scaleWidth, height: 22.6 * scaleHeight),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'image/block_image.png',
              width: 140 * scaleWidth,
              height: 184 * scaleHeight,
            ),
            SizedBox(height: 52 * scaleHeight),
            Text(
              '이용이 차단된 회원입니다',
              style: TextStyle(
                fontSize: 26 * scaleWidth,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16 * scaleHeight),
            Text(
              '관리자에게 문의바랍니다.',
              style: TextStyle(
                fontSize: 14 * scaleWidth,
                color: red,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * scaleWidth, vertical: 32 * scaleHeight),
        child: ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8 * scaleWidth),
            ),
            padding: EdgeInsets.symmetric(vertical: 16 * scaleHeight),
          ),
          child: Text(
            '확인',
            style: TextStyle(
              fontSize: 16 * scaleWidth,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
      ),
            ),
    );
  }
}
