import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:white_gym/global.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double scaleWidth = size.width / 375;
    double scaleHeight = size.height / 812;
    return Scaffold(
      backgroundColor: controller.isEmpty ? Colors.white : bg,
      appBar: AppBar(
          backgroundColor: controller.isEmpty ? Colors.white : bg,
          title: controller.isEmpty ? Text('알림', style: TextStyle(fontSize: 20 * scaleWidth, fontWeight: FontWeight.w600, color: gray900)) : null,
          centerTitle: true,
          automaticallyImplyLeading: true
      ),
      body: controller.isEmpty
          ? SafeArea(
            child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('image/icon_bell.png', width: 48 * scaleWidth, height: 48 * scaleHeight),
                    SizedBox(height: 12 * scaleHeight),
                    Text('알림 내역이 없어요', style: TextStyle(fontSize: 16 * scaleWidth, color: gray400, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
          )
          : Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * scaleWidth, vertical: 16 * scaleHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20 * scaleHeight,
            children: [
              Text('알림', style: TextStyle(fontSize: 24 * scaleWidth, fontWeight: FontWeight.w600),),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (_, index){
                  bool isRead = index > 1;
                    bool isComment = index > 1;
                    String comment = isComment ? '담당 트레이너가 연락 예정입니다.' : '';
                    String date = isComment ? '2024.11.16' : '오늘';
                    return Container(
                      padding: EdgeInsets.only(top: 12 * scaleHeight, left: 20 * scaleWidth, right: 12 * scaleWidth, bottom: 20 * scaleHeight),
                      margin: index == 3 ? null : EdgeInsets.only(bottom: 12 * scaleHeight),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffE5E5E5),
                            blurRadius: 20,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isRead
                              ? SizedBox(height: 5 * scaleHeight,)
                              : Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 5 * scaleWidth,
                              height: 5 * scaleWidth,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(color: mainColor),
                              ),
                            ),
                          ),
                          Text('OT 트레이너 배정이 완료되었습니다.', style: TextStyle(fontSize: 16 * scaleWidth, fontWeight: FontWeight.w500)),
                          isComment ? Text(comment, style: TextStyle(fontSize: 14 * scaleWidth, color: gray700, fontWeight: FontWeight.w500)) : SizedBox(height: 0),
                          SizedBox(height: 5 * scaleHeight,),
                          SizedBox(height: isComment ? 7 * scaleHeight : 0),
                          Text(date, style: TextStyle(fontSize: 14 * scaleWidth, color: Color(0xff7D8697), fontWeight: FontWeight.w400)),
                        ],
                      ),
                    );
                  })
            ],
          )
      ),
    );
  }
}
