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
                                    boxShadow: [
                                      BoxShadow(
                                        color: gray50,
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    spacing: 16 * scaleWidth,
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
                                              image: const DecorationImage(
                                                image: AssetImage('image/exgam_profile.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                          Text(
                                              '세션 기간',
                                            style: TextStyle(
                                              fontSize: 14 * scaleWidth,
                                              color: gray600,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          spacing: 21 * scaleHeight,
                                          children: [
                                            Container(
                                              height: 60 * scaleWidth,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: '김피티 ',
                                                              style: TextStyle(
                                                                fontSize: 16 * scaleWidth,
                                                                color: gray900,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '트레이너',
                                                              style: TextStyle(
                                                                fontSize: 12 * scaleWidth,
                                                                color: gray900,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ]
                                                        )
                                                      ),
                                                      Text(
                                                        '2025. 12. 23', style: TextStyle(
                                                          fontSize: 14 * scaleWidth,
                                                          color: gray500,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 28 * scaleHeight,
                                                    padding: EdgeInsets.symmetric(horizontal: 12 * scaleWidth, vertical: 4 * scaleHeight),
                                                    decoration: BoxDecoration(
                                                      color: blue50,
                                                      borderRadius: BorderRadius.circular(100),
                                                    ),
                                                    child: Text(
                                                        'PT 중급반 맞춤형 프로그램',
                                                      style: TextStyle(
                                                        fontSize: 14 * scaleWidth,
                                                        color: mainColor,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                                '2024. 01. 01 - 2024. 06. 30',
                                              style: TextStyle(
                                                fontSize: 16 * scaleWidth,
                                                color: gray900,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.5,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                AnimatedCrossFade(
                                  firstChild: Container(),
                                  secondChild: Container(
                                      width: size.width,
                                      padding: EdgeInsets.symmetric(horizontal: 20 * scaleWidth),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: gray50,
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: ListView.builder(
                                          shrinkWrap:   true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: 8,
                                          itemBuilder: (_, index){
                                            bool isCompleted = index == 7 ? false : true;
                                            return GestureDetector(
                                              onTap: () {
                                                controller.showBottomSheet(scaleHeight, scaleWidth, '${index + 1} 회차');
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 12 * scaleHeight),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('${index + 1} 회차', style: TextStyle(fontSize: 16 * scaleHeight, color: isCompleted ? gray900 : gray300, fontWeight: FontWeight.w500),),
                                                    isCompleted
                                                        ? Icon(Icons.arrow_forward_ios, color: gray500, size: 16 * scaleWidth,)
                                                        : Text('미완료', style: TextStyle(fontSize: 16 * scaleWidth, color: gray300, fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
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
