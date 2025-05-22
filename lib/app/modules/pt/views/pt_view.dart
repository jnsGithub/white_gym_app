import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:white_gym/global.dart';

import '../controllers/pt_controller.dart';

class PtView extends GetView<PtController> {
  const PtView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double scaleWidth = size.width / baseWidth;
    double scaleHeight = size.height / baseHeight;

    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'image/logo_text.png',
            width: 157 * scaleWidth,
            height: 22.6 * scaleHeight,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(() => Column(
          children: [
            TabBar(
              controller: controller.tabController,
              indicatorColor: mainColor,
              onTap: (value) {
                controller.selectedPageNumber.value = value;
                controller.update();
              },
              tabs: [
                Tab(
                  child: Text('이전 PT', style: TextStyle(fontSize: 16, color: controller.selectedPageNumber.value == 0 ?  mainColor : gray300, fontWeight: FontWeight.w600),),
                ),
                Tab(
                  child: Text('진행 중인 PT', style: TextStyle(fontSize: 16, color: controller.selectedPageNumber.value == 1 ?  mainColor : gray300, fontWeight: FontWeight.w600),),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20 * scaleWidth),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index){
                        RxBool isExpanded = false.obs;
                        return Obx(() => Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: size.width,
                                  padding: EdgeInsets.all(20 * scaleWidth),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12 * scaleWidth),
                                      topRight: Radius.circular(12 * scaleWidth),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 21 * scaleHeight,
                                        children: [
                                          Container(
                                            width: 60 * scaleWidth,
                                            height: 60 * scaleWidth,
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                          Text('세션 기간')
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('세션 기간'),
                                          SizedBox(height: 10 * scaleHeight,),
                                          Text('세션 기간'),
                                          SizedBox(height: 20 * scaleHeight,),
                                          Text('세션 기간')
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                AnimatedCrossFade(
                                  firstChild: Container(),
                                  secondChild: Container(
                                      width: size.width,
                                      padding: EdgeInsets.all(20 * scaleWidth),
                                      color: Colors.white,
                                      child: ListView.builder(
                                          shrinkWrap:   true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: 5,
                                          itemBuilder: (_, index){
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('$index 회차'),
                                                  Icon(Icons.arrow_forward_ios, color: gray300, size: 16 * scaleWidth,),
                                                ],
                                              ),
                                            );
                                          }
                                      )
                                  ),
                                  crossFadeState: isExpanded.value
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                                  duration: Duration(milliseconds: 200),
                                ),
                        
                                // 아래쪽에 title 위치
                                GestureDetector(
                                  onTap: () {
                                    isExpanded.value = !isExpanded.value;
                                  },
                                  child: Container(
                                    width: size.width,
                                    height: 46 * scaleHeight,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12 * scaleWidth),
                                          bottomRight: Radius.circular(12 * scaleWidth),
                                        ),
                                        border: Border(
                                          top: BorderSide(
                                            color: gray50,
                                            width: 1,
                                          ),
                                        )
                                    ),
                                    child: Center(child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('회차 정보 보기'),
                                        Icon(Icons.keyboard_arrow_down_rounded)
                                      ],
                                    )),
                                    // trailing: Icon(
                                    //   isExpanded.value ? Icons.expand_less : Icons.expand_more,
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20 * scaleHeight,),
                          ],
                        ),
                        );
                      }
                  ),
                ),
              ),
            )
          ],
        ),
        )
    );
  }
}
