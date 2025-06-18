import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:white_gym/app/modules/gymList/controllers/pt_list_controller.dart';
import 'package:white_gym/global.dart';

import '../../../routes/app_pages.dart';
import '../controllers/gym_detail_controller.dart';
import '../controllers/gym_list_controller.dart';

class GymListView extends GetView<GymListController> {
  const GymListView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Image(image: AssetImage('image/logo_text.png'), width: 157),
        centerTitle: true,
        leading: controller.isFirst.value?Container(): IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body:SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Row(
                  children: [
                    Obx(()=> Text('${controller.isPt.value? 'PT ':''}이용 지점',style: TextStyle(fontSize:24,fontWeight: FontWeight.w600,color: mainColor),)),
                    Text('을',style: TextStyle(fontSize:24,fontWeight: FontWeight.w600,color: text22),),
                  ],
                ),
                Text('선택해주세요',style: TextStyle(fontSize:24,fontWeight: FontWeight.w600,color: text22),),
                SizedBox(height: 16),
                GetBuilder<GymListController>(
                  builder: (controller) {
                    return SizedBox(
                      width: size.width,
                      child: Obx(()=>
                        ListView.builder(
                            itemCount: controller.gymList.length,
                            shrinkWrap: true,
                            physics:NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index){
                              return GestureDetector(
                                onTap: (){
                                  if(controller.isPt.value) {
                                    Get.toNamed(Routes.PT_LIST_VIEW,arguments: controller.gymList[index]);
                                  } else{
                                    Get.delete<GymDetailController>();
                                    Get.toNamed(Routes.GTM_DETAIL,arguments: controller.gymList[index]);
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: size.width*0.3413,
                                        height: size.width*0.3173,
                                        decoration: controller.gymList[index].imageUrlList.isEmpty?
                                          BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              color: gray200
                                          )
                                            :BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          image: DecorationImage(image: NetworkImage(controller.gymList[index].imageUrlList[0]),fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      SizedBox(
                                        width: size.width*0.6587 - 50,
                                        height: size.width*0.3173,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(controller.gymList[index].name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22)),
                                            Text('${controller.gymList[index].address} ${controller.gymList[index].addressDetail}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: text7D)),
                                            Text('${controller.gymList[index].distanceBetween}km',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: mainColor)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('(주)브랜드원',style: TextStyle(
                        fontSize: 12,fontWeight: FontWeight.w600,color: gray500
                    ),),
                    SizedBox(height: 15),
                    Text('대표 문배영 | 사업자 등록번호 370-86-03195\n주소 서울 강남구 논현로 319 1층\n통신판매업신고 제2025-서울강남-00691호\n고객센터 02-556-9688 | 이메일 whitegym@naver.com',style: TextStyle(
                        fontSize: 12,fontWeight: FontWeight.w400,color: gray500,height: 1.6
                    ),),
                    SizedBox(height: 30,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
