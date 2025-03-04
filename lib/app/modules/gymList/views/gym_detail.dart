import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:white_gym/app/modules/gymList/controllers/gym_detail_controller.dart';
import 'package:white_gym/app/routes/app_pages.dart';
import 'package:white_gym/component/main_box.dart';
import 'package:white_gym/global.dart';
class GymDetail extends GetView<GymDetailController> {
  const GymDetail({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Image(image: AssetImage('image/logo_text.png'), width: 157),
        centerTitle: true,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new)),
        actions: [
          loginState? IconButton(onPressed: (){
            Get.toNamed('/my-page');
          }, icon: const Icon(Icons.person,color: gray700,size: 30,)):Container(),
        ],
      ),
      body:SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  SizedBox(
                    width: size.width,
                    height: size.width*0.8,
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.spot.imageUrlList.length, // 페이지 수
                      onPageChanged: (index) {
                        controller.listIndex.value = index;
                      },
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          imageUrl: controller.spot.imageUrlList[controller.listIndex.value],
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          fit: BoxFit.cover,
                          maxHeightDiskCache: 500,
                          maxWidthDiskCache: 500,
                        );
                      },
                    ),
                  ),
              SizedBox(height: 14,),
                  Obx(()=>
                    Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: DotsIndicator(
                        dotsCount: controller.spot.imageUrlList.length, // 페이지 수
                        position: controller.listIndex.value,
                        decorator: DotsDecorator(
                          activeColor : mainColor, // 활성화된 도트 색상
                          size: const Size.square(6.0),
                          color: gray100,
                          activeSize: const Size(6.0, 6.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                        ),
                      ),
                    ),
                  ),

              SizedBox(height: 28),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.spot.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                       Image(image: AssetImage('image/distance.png'),width: 21,),
                        SizedBox(width: 8,),
                        Text('${controller.spot.address} ${controller.spot.addressDetail}',style: TextStyle(fontSize: 14,color: text22),),
                      ],
                    ),
                    SizedBox(height: 31,),
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: mainColor
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                            width: size.width,
                            child: Obx(()=>
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.moreLength.value,
                                itemBuilder: (context,index) {
                                  return SizedBox(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(controller.spotItemList[index].name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
                                        Row(
                                          children: [
                                            controller.spotItemList[index].isSubscribe?Text('월 ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),):Container(),
                                            Text(formatNumber(controller.spotItemList[index].price),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              ),
                            ),
                          ),
                          Obx(()=>
                          controller.spotItemList.length < 3 ? Container():
                            controller.moreCheck.value ? Container():GestureDetector(
                              onTap: (){
                                controller.getMoreList();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: size.width,
                                height: 52,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Color(0xff3290FF),
                                      width: 1
                                    )
                                  )
                                ),
                                child: Text('더보기',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Text('지점 소개',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22),),
                    SizedBox(height: 8,),
                    SizedBox(
                      width: size.width,
                      child: Text(controller.spot.descriptions,style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.w500,color: text7D,height: 1.6
                      ),),
                    ),
                    SizedBox(height: 40,),
                    Text('편의시설',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22),),
                    SizedBox(height: 15,),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              Container(
                                width: size.width * 0.2,
                                height: size.width * 0.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: mainColor,
                                ),
                                child: Image(image: AssetImage('image/gym/${controller.iconList[index]}'),width: size.width*0.1573,fit: BoxFit.fitWidth,),
                              ),
                              SizedBox(height: 8,),
                              Text(controller.iconTextList[index],style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: gray700),)
                            ],
                          );
                        },
                      shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1/1.45
                        ),
                    ),
                    SizedBox(height: 30,),
                    Text('지점위치',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22),),
                    SizedBox(height: 15,),
                    GetBuilder<GymDetailController>(
                      builder: (controller) {
                        return SizedBox(
                          width: size.width,
                          height: size.width*0.5013,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            markers: controller.markers,
                            myLocationButtonEnabled: false,
                            initialCameraPosition: controller.kGooglePlex,
                            onMapCreated: (GoogleMapController c) {
                              controller.initController(c);
                            },
                          ),
                        );
                      }
                    ),
                    SizedBox(height: 40,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child:
        GestureDetector(
            onTap: (){
              Get.toNamed('/payment',arguments: {'spot':controller.spot,'spotItemList':controller.spotItemList});
            },
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
              child: MainBox(text: '지점 선택', color: mainColor, textColor: Colors.white),
            ),
          ),
        ),

    );
  }
}
