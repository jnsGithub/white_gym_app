import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:white_gym/app/modules/myPage/controllers/setting_controller.dart';

import '../../../../global.dart';
import '../../../routes/app_pages.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: const Image(image: AssetImage('image/logo_text.png'), width: 157),
        centerTitle: true,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new,color: gray700,)),
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40,bottom: 18),
                  child: Text('설정',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical:  10,horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 46,
                        child: Row(
                          children: [
                            Text('푸시 알림 동의',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: text22),),
                            Spacer(),
                            Obx(()=>
                                FlutterSwitch(
                                  activeColor: mainColor,
                                  inactiveColor: Color(0xffE2E8F0),
                                  width: 44.0,
                                  height: 22.0,
                                  toggleSize: 20.0,
                                  padding: 1,
                                  value: controller.pushCheck.value,
                                  borderRadius: 30.0,
                                  showOnOff: false,
                                  onToggle:(value) {controller.pushCheck.value = !controller.pushCheck.value;},
                                ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 46,
                        child: Row(
                          children: [
                            Text('마케팅 정보 수신 동의',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: text22),),
                            Spacer(),
                            Obx(()=>
                                FlutterSwitch(
                                  activeColor: mainColor,
                                  inactiveColor: Color(0xffE2E8F0),
                                  width: 44.0,
                                  height: 22.0,
                                  toggleSize: 20.0,
                                  padding: 1,
                                  value: controller.smsCheck.value,
                                  borderRadius: 30.0,
                                  showOnOff: false,
                                  onToggle:(value) {controller.smsCheck.value = !controller.smsCheck.value;},
                                ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  padding: EdgeInsets.symmetric(vertical:  10,horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          launchUrl('https://voltaic-feels-279.notion.site/18f22ae39984807d967ecfc64eb26fda?pvs=4');
                        },
                        child: Container(
                          width: size.width,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('개인정보처리방침 ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:text22),),
                              Icon(Icons.arrow_forward_ios,size: 17,color: gray500,),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          launchUrl('https://voltaic-feels-279.notion.site/18222ae3998480afadd7e211f20d4448?pvs=4');
                        },
                        child: Container(
                          width: size.width,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('이용약관',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:text22),),
                              Icon(Icons.arrow_forward_ios,size: 17,color: gray500,),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed('/edit-hp');
                        },
                        child: Container(
                          width: size.width,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('휴대폰 번호 변경',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:text22),),
                              Icon(Icons.arrow_forward_ios,size: 17,color: gray500,),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.logout();
                        },
                        child: Container(
                          width: size.width,
                          height: 46,
                          decoration: BoxDecoration(
                              color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('로그아웃',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:text22),),
                              Icon(Icons.arrow_forward_ios,size: 17,color: gray500,),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.accountDeletion();
                        },
                        child: Container(
                          width: size.width,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('회원탈퇴',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:text22),),
                              Icon(Icons.arrow_forward_ios,size: 17,color: gray500,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]
          ),
        )
    );
  }
}
