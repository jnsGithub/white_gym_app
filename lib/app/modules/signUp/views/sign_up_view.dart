import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../component/customCheckBox.dart';
import '../../../../component/main_box.dart';
import '../../../../global.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('image/logo_text.png',width: 157,),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        left: false,
        right: false,
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 50,),
                 Text('회원가입을 위해\n인증 절차를 완료해주세요',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
                 SizedBox(height: 25,),
                 Text('타인의 개인정보를 도용하여 가입할 경우,\n서비스 이용 제한 및 법적 제재를 받으실 수 있습니다',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: text7D),)
               ],
             ),
              Obx(()=>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => controller.check(4),
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: controller.allCheck.value ? Colors.blue : Color(0xffEEF1F7),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomCheckbox(
                              allCheck: true,
                              isChecked: controller.allCheck.value,
                              borderColor: controller.allCheck.value ? Colors.blue : Colors.grey,
                              fillColor: Colors.blue,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "모두 동의합니다",
                              style: TextStyle(
                                color: controller.allCheck.value ? Colors.black : text7D,
                                fontWeight: FontWeight.w600,
                                fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    SizedBox(
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => controller.check(1),
                            child: Row(
                              children: [
                                CustomCheckbox(
                                  allCheck: false,
                                  isChecked: controller.check1.value,
                                  borderColor: controller.check1.value ? Colors.blue : Colors.grey,
                                  fillColor: Colors.blue,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "회원 서비스 이용약관",
                                  style: TextStyle(
                                      color: controller.check1.value ?  text22 : text7D,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(onTap:(){launchUrl('https://voltaic-feels-279.notion.site/18222ae3998480afadd7e211f20d4448?pvs=4');},child: Icon(Icons.arrow_forward_ios,color: text7D,size: 14,))
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    SizedBox(
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => controller.check(2),
                            child: Row(
                              children: [
                                CustomCheckbox(
                                  allCheck: false,
                                  isChecked: controller.check2.value,
                                  borderColor: controller.check2.value ? Colors.blue : Colors.grey,
                                  fillColor: Colors.blue,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "개인정보처리방침",
                                  style: TextStyle(
                                      color: controller.check2.value ?  text22 : text7D,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(onTap:(){ launchUrl('https://voltaic-feels-279.notion.site/18f22ae39984807d967ecfc64eb26fda?pvs=4');},child: Icon(Icons.arrow_forward_ios,color: text7D,size: 14,))
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    GestureDetector(
                      onTap: () => controller.check(3),
                      child: SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            CustomCheckbox(
                              allCheck: false,
                              isChecked: controller.check3.value,
                              borderColor: controller.check3.value ? Colors.blue : Colors.grey,
                              fillColor: Colors.blue,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "마케팅정보 수신 동의 (선택)",
                              style: TextStyle(
                                  color: controller.check3.value ?  text22 : text7D,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 32,),
                    GestureDetector(
                      onTap: (){
                        if(controller.check1.value && controller.check2.value){
                          controller.bootpayTest();
                        }
                      },
                      child: Container(
                        width: size.width,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: controller.check1.value && controller.check2.value ? mainColor: Color(0xffEEF1F7)
                        ),
                        child: Text('휴대폰 본인인증 ',style: TextStyle(color: controller.check1.value && controller.check2.value ? Colors.white:Color(0xffA5ADBE),fontSize: 17,fontWeight: FontWeight.w600),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
