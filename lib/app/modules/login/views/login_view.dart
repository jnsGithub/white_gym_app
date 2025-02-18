import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:white_gym/component/main_box.dart';
import 'package:white_gym/global.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Image(image: AssetImage('image/logo_text.png'), width: 157),
          centerTitle: true,
          leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body: Obx(()=>
          SafeArea(
            top: false,
            left: false,
            right: false,
            bottom: true,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 28,),
                        Text(controller.isSmsSend.value ? '문자로 전송된\n인증번호를 입력해주세요':'회원가입 시 입력한\n휴대폰 번호를 입력해주세요',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
                        SizedBox(height: 32,),
                        Container(
                          width: size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            style: TextStyle(color:text22,fontSize: 16,fontWeight: FontWeight.w400),
                            controller: controller.isSmsSend.value ?controller.authController:controller.phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: controller.isSmsSend.value ?'인증번호':'휴대폰 번호',
                              hintStyle: TextStyle(color:Color(0xffCCCCCC),fontSize: 16,fontWeight: FontWeight.w400),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                            onChanged: (v){
                              controller.check(v);
                            },
                          ),
                        ),
                        SizedBox(height: 32,),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                          onTap: () async {

                            controller.isSmsSend.value ? controller.auth():controller.sendSms();
                          },
                          child: controller.isSmsSend.value ?
                          MainBox(text: '인증하기', color: mainColor, textColor: Colors.white):
                          MainBox(text: '핀번호 받기', color:controller.hpCheck.value? mainColor:Color(0xffEEF1F7),textColor:controller.hpCheck.value?Colors.white:Color(0xffA5ADBE)),
                      ),
                    ),

                  ],
                ),
            ),
          ),
        )
      ),
    );
  }
}
