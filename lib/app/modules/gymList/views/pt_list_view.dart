import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:white_gym/global.dart';
import '../../../model/staff.dart';
import '../../../routes/app_pages.dart';
import '../controllers/gym_detail_controller.dart';
import '../controllers/gym_list_controller.dart';
import '../controllers/pt_list_controller.dart';

class PtListView extends GetView<PtListController> {
  const PtListView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
               Container(
                 width: size.width,
                  height: size.width*0.4213,
                 padding: EdgeInsets.all(20),
                 decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: mainColor,
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('PT 제안을 받아보세요!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white,height: 1.4),),
                     Text('클릭 한 번에 다양한 PT를 제안받아보세요',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white,height: 1.4),),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         GestureDetector(
                           onTap: () async {
                              Get.toNamed(Routes.OT,arguments:controller.staffList);
                             // await controller.getPtList();
                           },
                           child: Container(
                             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10000),
                             ),
                             child: Text('PT 제안받기',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: mainColor),),
                           ),
                         )
                       ],
                     )
                   ],
                 ),
               ),
                SizedBox(
                  height: 24,
                ),
                Obx(()=>
                  ListView.builder(
                      itemCount: controller.staffList.length,
                      shrinkWrap: true,
                      physics:NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        Staff staff = controller.staffList[index];
                        return GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.PT_ITEM_VIEW,arguments: {'trainer': staff, 'spot': controller.spot});
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  spacing: 2,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: size.width*0.4267,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(staff.imageList[0]),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      spacing: 2,
                                      children: [
                                        Container(
                                          width: size.width*0.2133,
                                          height: size.width*0.2107,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(staff.imageList[1]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: size.width*0.2133,
                                          height: size.width*0.2107,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(staff.imageList[2]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(staff.name,style: TextStyle(
                                              fontSize: 18,fontWeight: FontWeight.w600,color: gray900,height: 1.4
                                          ),),
                                          SizedBox(width: 4),
                                          Text('트레이너',style: TextStyle(
                                              fontSize: 14,fontWeight: FontWeight.w500,color: gray900,height: 1.4
                                          ),),
                                        ],
                                      ),
                                      Text('리뷰 ${00}개',style: TextStyle(
                                          fontSize: 14,fontWeight: FontWeight.w500,color: gray500,height: 1.4
                                      ),),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
