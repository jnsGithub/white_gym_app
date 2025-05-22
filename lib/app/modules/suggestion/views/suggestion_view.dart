import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global.dart';
import '../controllers/suggestion_controller.dart';

class SuggestionView extends GetView<SuggestionController> {
  const SuggestionView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double scaleWidth = width / 375;
    double scaleHeight = height / 812;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('건의사항', style: TextStyle(fontSize: 20 * scaleWidth, color: gray900, fontWeight: FontWeight.w600),),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 * scaleWidth, vertical: 20 * scaleHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20 * scaleHeight,
              children: [
                containerTemplate(
                    scaleWidth: scaleWidth,
                    scaleHeight: scaleHeight,
                    title: '지점명',
                    child: Obx(() => DropdownButtonHideUnderline(
                      child: DropdownButton2(
                          hint: Text(
                            controller.selectedSpot.value,
                            style: TextStyle(
                                fontSize: 16 * scaleWidth,
                                color: controller.selectedSpot.value == '선택해주세요'
                                    ? gray500
                                    : mainColor,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          items: controller.spotList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 16 * scaleWidth, color: gray900, fontWeight: FontWeight.w400),),
                            );
                          }).toList(),
                          onChanged: (item) {
                            controller.selectedSpot.value = item.toString();
                          },
                          iconStyleData: IconStyleData(
                            icon: Icon(Icons.keyboard_arrow_down, size: 25 * scaleWidth, color: gray900),
                          ),
                          buttonStyleData: ButtonStyleData(
                            height: 50 * scaleHeight,
                            width: 335 * scaleWidth,
                            padding: EdgeInsets.symmetric(horizontal: 16 * scaleWidth, vertical: 12 * scaleHeight),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              border: Border.all(color: gray200),
                            ),
                            elevation: 0,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200 * scaleHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                          )
                      ),
                    ),
                    )
                ),
                containerTemplate(
                    scaleWidth: scaleWidth,
                    scaleHeight: scaleHeight,
                    title: '건의 유형',
                    child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16 * scaleHeight,
                        children:[
                          for(int i = 0; i < 5; i++)
                            Row(
                              children: [
                                Transform.translate(
                                  offset: Offset(-4 * scaleWidth, 0), // ← x축으로 -10만큼 이동
                                  child: Transform.scale(
                                    scale: 1.25,
                                    child: Radio(
                                      value: i,
                                      groupValue: controller.groupValue.value,
                                      activeColor: mainColor,
                                      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                        if (controller.groupValue.value == i) {
                                          return mainColor; // ✅ 비활성화 시 색상
                                        }
                                        return gray100; // ✅ 기본 색상
                                      }),
                                      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                      onChanged: (value){
                                        controller.groupValue.value = value as int;
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  controller.radioList[i],
                                  style: TextStyle(fontSize: 16 * scaleWidth, color: gray900, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                        ],
                      ),
                    )
                ),
                containerTemplate(
                    scaleWidth: scaleWidth,
                    scaleHeight: scaleHeight,
                    title: '가장 좋았던 점',
                    child: Container(
                      width: 295 * scaleWidth,
                      height: 96 * scaleHeight,
                      padding: EdgeInsets.symmetric(horizontal: 16 * scaleWidth, vertical: 0 * scaleHeight),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: gray200),
                      ),
                      child: TextField(
                        maxLines: 5,
                        controller: controller.goodController,
                        decoration: InputDecoration(
                          hintText: '만족한 점에 대해 작성해주세요.',
                          hintStyle: TextStyle(fontSize: 16 * scaleWidth, color: gray500, fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                        ),
                      ),
                    )
                ),
                containerTemplate(
                    scaleWidth: scaleWidth,
                    scaleHeight: scaleHeight,
                    title: '개선 사항',
                    child: Container(
                      width: 295 * scaleWidth,
                      height: 96 * scaleHeight,
                      padding: EdgeInsets.symmetric(horizontal: 16 * scaleWidth, vertical: 0 * scaleHeight),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: gray200),
                      ),
                      child: TextField(
                        maxLines: 5,
                        controller: controller.goodController,
                        decoration: InputDecoration(
                          hintText: '설명을 작성해 주세요.',
                          hintStyle: TextStyle(fontSize: 16 * scaleWidth, color: gray500, fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                        ),
                      ),
                    )
                ),
                containerTemplate(
                    scaleWidth: scaleWidth,
                    scaleHeight: scaleHeight,
                    title: '기타 사항',
                    child: Container(
                      width: 295 * scaleWidth,
                      height: 50 * scaleHeight,
                      padding: EdgeInsets.symmetric(horizontal: 16 * scaleWidth, vertical: 0 * scaleHeight),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: gray200),
                      ),
                      child: TextField(
                        maxLines: 5,
                        controller: controller.goodController,
                        decoration: InputDecoration(
                          hintText: '설명을 작성해 주세요.',
                          hintStyle: TextStyle(fontSize: 16 * scaleWidth, color: gray500, fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 11 * scaleHeight)
                        ),
                      ),
                    )
                ),
              Container(
                  width: 335 * scaleWidth,
                  // height: 126 * scaleHeight,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20 * scaleHeight,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '연락처',
                              style: TextStyle(fontSize: 18 * scaleWidth, color: Color(0xff000000), fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: ' (선택)',
                              style: TextStyle(fontSize: 14 * scaleWidth, color: gray500, fontWeight: FontWeight.w600),
                            ),
                          ]
                        )
                      ),
                      Container(
                        width: 295 * scaleWidth,
                        height: 50 * scaleHeight,
                        padding: EdgeInsets.symmetric(horizontal: 16 * scaleWidth, vertical: 0 * scaleHeight),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(color: gray200),
                        ),
                        child: TextField(
                          maxLines: 5,
                          controller: controller.goodController,
                          decoration: InputDecoration(
                              hintText: '연락처를 입력해 주세요.',
                              hintStyle: TextStyle(fontSize: 16 * scaleWidth, color: gray500, fontWeight: FontWeight.w400),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 11 * scaleHeight)
                          ),
                        ),
                      ),
                    ],
                  )
              ),
                containerTemplate(
                    scaleWidth: scaleWidth,
                    scaleHeight: scaleHeight,
                    title: '서비스 평가 점수',
                    child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for(int i = 1; i <= 5; i++)
                            GestureDetector(
                              onTap: (){
                                controller.selectedIndex.value = i;
                              },
                              child: scoreColumn(
                                scaleWidth: scaleWidth,
                                score: i,
                                selectedIndex: controller.selectedIndex,
                              ),
                            ),
                        ],
                      ),
                    )
                )
              ],
            ),
          )
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20 * scaleWidth, right: 20 * scaleWidth),
          child: Container(
            width: 335 * scaleWidth,
            height: 50 * scaleHeight,
            margin: EdgeInsets.only(bottom: 20 * scaleHeight),
            child: ElevatedButton(
              onPressed: () {
                // Submit action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('제출하기', style: TextStyle(fontSize: 17 * scaleWidth, color: Colors.white, fontWeight: FontWeight.w600),),
            ),
          ),
        ),
      )
    );
  }

  Widget scoreColumn({required double scaleWidth, required int score, required RxInt selectedIndex}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Container(
          alignment: Alignment.center,
          width: 38 * scaleWidth,
          height: 38 * scaleWidth,
          decoration: BoxDecoration(
            color: selectedIndex.value == score ? blue50 : Colors.white,
            border: Border.all(
              color: selectedIndex.value == score ? mainColor : gray100,
              width: selectedIndex.value == score ? 2 : 1.5,
            ),
            borderRadius: BorderRadius.circular(60),
          ),
          child: Text(
            '$score',
            style: TextStyle(
                fontSize: 16 * scaleWidth,
                color: selectedIndex.value == score
                    ? mainColor
                    : gray800,
                fontWeight: selectedIndex.value == score
                    ? FontWeight.w700
                    : FontWeight.w500
            ),
          ),
        ),
        Text(
          score == 1 ? '나쁨' : score == 2 ? '' : score == 3 ? '' : score == 4 ? '' : '좋음',
          style: TextStyle(
              fontSize: 14 * scaleWidth,
              color: gray500,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }

  Widget containerTemplate({required double scaleWidth, required double scaleHeight, required String title, required Widget child}) {
    return Container(
        width: 335 * scaleWidth,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20 * scaleHeight,
          children: [
            Text(title, style: TextStyle(fontSize: 18 * scaleWidth, color: Color(0xff000000), fontWeight: FontWeight.w600),),
            child,
          ],
        )
    );
  }
}
