import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:white_gym/app/modules/myPage/controllers/edit_hp_controller.dart';
import 'package:white_gym/component/main_box.dart';
import 'package:white_gym/global.dart';

import '../../../routes/app_pages.dart';


class EditHpView extends GetView<EditHpController> {
  const EditHpView({super.key});
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
          body:
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
                      Text('변경하실\n휴대폰 번호를 입력해주세요',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22,height: 1.6),),
                      SizedBox(height: 32,),
                      GestureDetector(
                        onTap: (){
                          controller.bootpay();
                        },
                        child: Container(
                          width: size.width,
                          height: 50,
                          padding: EdgeInsets.only(left: 16),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Obx(()=> Text(controller.hp.value != ''?controller.hp.value:'휴대폰 번호',style: controller.hp.value != ''?TextStyle(color:text22,fontSize: 16,fontWeight: FontWeight.w400):TextStyle(color:Color(0xffCCCCCC),fontSize: 16,fontWeight: FontWeight.w400),))

                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                        onTap: ()async {
                          if(controller.hp.value == '') {
                            controller.bootpay();
                          } else {
                            bool check = await controller.editHp();
                            if(check){
                              box.remove('documentId');
                              Get.offAllNamed(Routes.HOME);
                              Get.snackbar('변경 완료', '변경이 완료되었습니다. 다시 로그인해주세요.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
                            } else {
                              Get.snackbar('변경 실패', '변경에 실패했습니다. 다시 시도해���세요.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
                            }
                          }
                          // else controller.editHp();
                        },
                        child:
                        MainBox(text: '변경하기', color: mainColor, textColor: Colors.white)
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
