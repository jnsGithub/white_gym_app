import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:white_gym/app/routes/app_pages.dart';

import '../../../../global.dart';
import '../controllers/main_home_controller.dart';

class MainHomeView extends GetView<MainHomeController> {
  const MainHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: GestureDetector(
          onTap: (){
            Get.toNamed(Routes.GYM_LIST);
            // controller.changeSubscribe();
          },
            child: Image(image: const AssetImage('image/logo_text.png'), width: 157)
        ),
        centerTitle: false,
        leading: Container(),
        leadingWidth: 0,
        actions: [
          IconButton(onPressed: (){
            Get.toNamed('/my-page');
          }, icon: const Icon(Icons.person,color: gray700,size: 30,)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // 뺴야함
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 60,),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: size.width*0.208,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        if(controller.isPass.value){
                                          controller.changeGym();
                                        } else {
                                          Get.toNamed(Routes.GYM_LIST);
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 12,right: 12),
                                        height: 37,
                                        decoration: BoxDecoration(
                                          color: Color(0xff003BC1),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Obx(()=> Text(controller.paymentBranch.value,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),)),
                                            Icon(Icons.arrow_drop_down_sharp,color: Colors.white,size: 30,)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          myInfo.name.length > 6 ? '${myInfo.name.substring(0,6)}...' : myInfo.name,
                                          style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),
                                        ),
                                        SizedBox(width: 4,),
                                        Text('회원님',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff97B6FF)),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                                GestureDetector(
                                  onTap: (){
                                    if(controller.status.value || controller.subscribe.value){
                                      controller.getQrPassWord(false);
                                    }
                                  },
                                  child: Container(
                                    width: size.width*0.208,
                                    height: size.width*0.208,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('출입',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: mainColor),),
                                        Text('QR',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: mainColor),),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Obx(()=>
                          Container(
                            width: size.width,
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 22),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await Get.toNamed(Routes.PAUSE_TICKET,arguments: controller.subscribe.value);
                                          controller.status.value = myInfo.ticket.status;
                                          controller.subscribe.value = myInfo.ticket.subscribe;
                                          // if(!controller.subscribe.value) Get.toNamed(Routes.PAUSE_TICKET);
                                        },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10,right: 15),
                                        alignment: Alignment.centerLeft,
                                        width: size.width,
                                        height: 54,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            stops: const [0.0,1.0],
                                            colors:controller.status.value || controller.subscribe.value? const [
                                              Color(0xff5D8EFF),
                                              mainColor
                                            ]:const [
                                              gray500,
                                              gray700
                                            ],
                                          ),
                                        ),
                                        child:controller.status.value || controller.subscribe.value?
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.play_arrow,color: Colors.white,size: 24,),
                                                SizedBox(width: 8,),
                                                Text(myInfo.ticket.spotItem.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),),
                                              ],
                                            ),
                                            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,)
                                          ],
                                        ):
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.pause,color: Colors.white,size: 24,),
                                                SizedBox(width: 8,),
                                                Text(myInfo.ticket.spotItem.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),),
                                              ],
                                            ),
                                            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,)
                                          ],
                                        )
                                      ),
                                    ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('이번달 출석 횟수',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: text7D),),
                                          SizedBox(width: 4,),
                                          Obx(()=> Text(controller.visitHistory.length.toString(),style: TextStyle(fontWeight: FontWeight.w600,color: mainColor,fontSize: 16),)),
                                          Text('회',style: TextStyle(fontWeight: FontWeight.w600,color: text22,fontSize: 16),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image(image: AssetImage('image/main_home_icon1.png'),width: 14,),
                                          SizedBox(width: 8,),
                                          Text(myInfo.ticket.locker?'${myInfo.ticket.lockerNum} 번':'미사용',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: myInfo.ticket.locker?mainColor:text22),),
                                          Container(
                                            width: 1,
                                            height: 14,
                                            margin: EdgeInsets.symmetric(horizontal: 12),
                                            color: Color(0xffD9D9D9),
                                          ),
                                          Image(image: AssetImage('image/main_home_icon2.png'),width: 14,),
                                          SizedBox(width: 8,),
                                          Text(myInfo.ticket.sportswear?'사용':'미사용',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: text22),),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('(주)브랜드원',style: TextStyle(
                      fontSize: 12,fontWeight: FontWeight.w600,color: gray500
                  ),),
                  SizedBox(height: 15),
                  Text('대표 문배영 | 사업자 등록번호 370-86-03195\n주소 서울 강남구 논현로 319 1층\n통신판매업신고 제2025-서울강남-00691호\n고객센터 02-556-9688 | 이메일 whitegym@naver.com',style: TextStyle(
                      fontSize: 12,fontWeight: FontWeight.w400,color: gray500,height: 1.5
                  ),),
                  SizedBox(height: 30,)
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
