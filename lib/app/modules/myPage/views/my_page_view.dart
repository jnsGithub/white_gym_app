import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global.dart';
import '../../../routes/app_pages.dart';
import '../controllers/my_page_controller.dart';

class MyPageView extends GetView<MyPageController> {
  const MyPageView({super.key});
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(myInfo.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
                      Text(' 회원님 ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: text7D),),
                    ],
                  ),
                  SizedBox(height: 21,),
                  Text('내 구독',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: text22),),
                  SizedBox(height: 8,),
                  GestureDetector(
                    onTap: (){
                      if(controller.isDone.value){
                        Get.toNamed(Routes.GYM_LIST);
                      } else {
                        Get.toNamed(Routes.PAUSE_TICKET);
                      }
                    },
                    child: Container(
                      width: size.width,
                      height: 54,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff5D8EFF),mainColor],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.isDone.value ?'멤버쉽 구매하기':myInfo.ticket.spotItem.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
                          Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.toNamed('/card-list');
                          },
                          child: Container(
                            width: size.width,
                            height: 46,
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('image/card.png',width: 24,),
                                    SizedBox(width: 8,),
                                    Text('결제 카드 관리',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: text22),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,color: text7D,size: 20,)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed('/payment-list');
                          },
                          child: Container(
                            width: size.width,
                            height: 46,
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('image/payment.png',width: 24,),
                                    SizedBox(width: 8,),
                                    Text('결제 내역',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: text22),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,color: text7D,size: 20,)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed('/setting');
                          },
                          child: Container(
                            width: size.width,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('image/setting.png',width: 24,),
                                    SizedBox(width: 8,),
                                    Text('설정',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: text22),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,color: text7D,size: 20,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('(주)브랜드원',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: gray500),),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text('대표 문배영',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: gray500),),
                        Text(' | ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xffCBD0D7)),),
                        Text('사업자 등록번호 370-86-03195',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: gray500),),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Text('주소 서울 강남구 논현로 319 1층',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: gray500),),
                    SizedBox(height: 8,),
                    Text('통신판매업신고 제2025-서울강남-00691호',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: gray500),),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Text('고객센터 02-556-9688',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: gray500),),
                        Text(' | ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xffCBD0D7)),),
                        Text('이메일 whitegym@naver.com',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: gray500),),
                      ],
                    ),
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
