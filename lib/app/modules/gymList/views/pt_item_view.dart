import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:white_gym/app/model/ptItem.dart';
import 'package:white_gym/app/modules/gymList/controllers/pt_item_controller.dart';

import '../../../../component/expandable.dart';
import '../../../../global.dart';
import '../../../routes/app_pages.dart';

class PtItemView extends GetView<PtItemController> {
  const PtItemView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2, // 탭 개수
      initialIndex: 0,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(controller.spot.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: gray900),),
            centerTitle: true,
            leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new)),
            actions: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage('image/icon/icon_bell.png'),
                        fit: BoxFit.fitWidth,
                      )
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage('image/icon/icon_peson.png'),
                        fit: BoxFit.fitWidth,
                      )
                  ),
                ),
              )
            ],
          ),
          body:SafeArea(
            bottom: true,
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    SizedBox(
                      height: size.width*0.8215,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            child: SizedBox(
                              width: size.width,
                              height: size.width*0.64,
                              child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.trainer.imageList.length,
                                  itemBuilder: (context , index ){
                                    return Container(
                                      width: size.width,
                                      height: size.width*0.64,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(controller.trainer.imageList[index]),
                                              fit: BoxFit.fitWidth
                                          )
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.width*0.5867,
                            child: Container(
                              width: size.width,
                              padding: EdgeInsets.only(top:size.width*0.16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      spacing: 6,
                                      children: [
                                        Text(controller.trainer.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,height: 1.4,color: gray900),),
                                        Text('트레이너',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,height: 1.4,color: gray900),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.width*0.4533,
                            child: Container(
                              width: size.width*0.2667,
                              height: size.width*0.2667,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10000),
                                color: Colors.white,
                              ),
                              child: ClipRRect(borderRadius:BorderRadius.circular(10000),child: Image(image:  NetworkImage(controller.trainer.profileImageUrl),fit: BoxFit.cover,)),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 6),
                            ExpandableText(
                              text: controller.trainer.intro,
                              maxLines: 3,
                              textStyle: const TextStyle(
                                fontSize: 16,
                                height: 1.6,
                                fontWeight: FontWeight.w400,
                                color: gray900,
                              ),
                              expandText: '더보기',
                              collapseText: '간략히',
                              linkColor: Color(0xff2969FF),
                            ),
                            SizedBox(height: 26),
                            Container(
                              width: size.width,
                              height: size.width*0.2533,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xffE2E8F0), width: 1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  Text('수업 가능 시간',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        spacing: 8,
                                        children: [
                                          Text('평일',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,height: 1.4,color: gray700),),
                                          Text(controller.trainer.weekdaysTime,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: blue700,height: 1.4),),
                                        ],
                                      ),
                                      Row(
                                        spacing: 8,
                                        children: [
                                          Text('주말',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,height: 1.4,color: gray700),),
                                          Text(controller.trainer.weekendTime,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: blue700,height: 1.4),),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 28),
                    SizedBox(
                      height: 48,
                      child: TabBar(
                        indicatorColor: mainColor,
                        labelColor: mainColor,
                        unselectedLabelColor: gray300,
                        indicatorWeight: 2,
                        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        tabs: [
                          Tab(text: '수업'),
                          Tab(text: '리뷰 100+'),
                        ],
                        onTap: (index) {
                          controller.tabIndex.value = index;
                        },
                      ),
                    ),
                    Container(height: 1, color: Colors.grey.shade300), // 밑줄 경계선
                    Obx(()=>
                    controller.tabIndex.value == 0 ?
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.ptGroupList.length,
                                itemBuilder: (context , index ){
                                  return Container(
                                    margin: EdgeInsets.only(top: 26,left: 20,right: 20),
                                    padding: EdgeInsets.symmetric(vertical: 22,horizontal: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color:gray500, width: 1),
                                        color: Colors.white
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.ptGroupList[index]['name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                                        SizedBox(height: 8,),
                                        Text(controller.ptGroupList[index]['description'],style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: gray700,height: 1.4),),
                                        SizedBox(height: 20,),
                                        Obx(()=>
                                        controller.isLoading.value?
                                        ListView.builder(
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller.ptGroupList[index]['ptItemList'].length,
                                            itemBuilder: (context , index2 ){
                                              PtItem ptItem = controller.ptGroupList[index]['ptItemList'][index2];
                                              return GestureDetector(
                                                onTap: (){
                                                  Get.toNamed(Routes.PT_PAYMENT, arguments: {
                                                    'spot' : controller.spot,
                                                    'trainer': controller.trainer,
                                                    'ptItem': ptItem,
                                                    'ptGroup': controller.ptGroupList[index],
                                                  });
                                                },
                                                child: Container(
                                                  width: size.width,
                                                  margin: EdgeInsets.only(bottom:controller.ptGroupList[index]['ptItemList'].length-1 ==index2 ?0:20),
                                                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                                                  decoration: BoxDecoration(
                                                    color: blue50,
                                                    borderRadius: BorderRadius.circular(4),
                                                    border: Border(left: BorderSide(color: blue700, width: 3)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    spacing: 4,
                                                    children: [
                                                      Text(ptItem.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray900,height: 1.4)),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text('${ptItem.admission}회',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: gray700,height: 1.4)),
                                                          Text(formatNumber(ptItem.price),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: blue700,height: 1.4)),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                        ):Container(),
                                        )
                                      ],
                                    ),
                                  );
                                }
                            ):
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.ptGroupList.length,
                              itemBuilder: (context , index ){
                                return Container(
                                  margin: EdgeInsets.only(top: 26,left: 20,right: 20),
                                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: gray50
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(controller.reviewList[index].userName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: gray900,height: 1.4),),
                                          Text(formatExpiryDate(controller.reviewList[index].createDate),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: gray500,height: 1.4),)
                                        ],
                                      ),
                                      SizedBox(height: 8,),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                                        decoration: BoxDecoration(
                                          color: blue50,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(controller.reviewList[index].programName,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,height: 1.4,color: blue500),),
                                      ),
                                      SizedBox(height: 14,),
                                      Text(controller.reviewList[index].content,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: gray900,height: 1.6),),
                                    ],
                                  ),
                                );
                              }
                          ),
                      ),
                    SizedBox(height: 40,)
                  ],
                ),
              ),
            ),
          )
    );
  }
}
