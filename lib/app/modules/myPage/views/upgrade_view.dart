import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:white_gym/app/modules/myPage/controllers/upgradeController.dart';

import '../../../../global.dart';
import '../../../routes/app_pages.dart';

class UpgradeView extends GetView<UpgradeController> {
  const UpgradeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: const Image(image: AssetImage('image/logo_text.png'), width: 157),
        centerTitle: true,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new,color: gray700,)),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('이용권 업그레이드',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: mainColor,height: 1.4),),
              Text('방법을 선택해주세요',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.UPGARDE_MEMBERSHIP);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 22,horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      Text('모든 지점 이용권', style: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                      Column(
                        spacing: 8,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check,color: mainColor,size: 20,),
                              Text('화이트짐',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                              Text('화이트짐 모든 지점 이용',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: mainColor,height: 1.4),)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.check,color: mainColor,size: 20,),
                              Text('일일 입장 가능 횟수',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                              Text('무제한',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: mainColor,height: 1.4),)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.check,color: mainColor,size: 20,),
                              Text('PRO 멤버십',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                              Text('전용 이벤트',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: mainColor,height: 1.4),)
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                        decoration: BoxDecoration(
                          color: blue50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('PRO 멤버십으로 변경해요.\n이용권은 결제 후 바로 변경돼요.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,height: 1.6,color: mainColor),),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              myInfo.ticket.subscribe?Container():GestureDetector(
                onTap: () async {
                  await controller.getItem();
                  Get.toNamed('/payment',arguments: {'spot':controller.spot,'spotItemList':controller.spotItemList,'extend':true});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 22,horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      Text('이용권 연장', style: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Text('남은 기간이 아쉽다면?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                          Row(
                            children: [
                              Text('지금 바로',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                              Text('이용 일수 추가',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: mainColor,height: 1.4),)
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                        decoration: BoxDecoration(
                          color: blue50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('내 이용권 기간을 연장해요.\n기간은 결제 후 바로 연장돼요.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,height: 1.6,color: mainColor),),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
