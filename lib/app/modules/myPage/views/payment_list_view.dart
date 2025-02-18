import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:white_gym/app/modules/myPage/controllers/payment_list_controller.dart';

import '../../../../global.dart';

class PaymentListView extends GetView<PaymentListController> {
  const PaymentListView({super.key});
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
      body:SafeArea(
        child: Obx(()=>
        controller.isLoading.value ?
            Container():
        controller.paymentList.isEmpty?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cancel,color: gray200,size: 37,),
              SizedBox(height: 30,),
              Text('결제내역이 없습니다.',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: gray600),),
              SizedBox(height: 100,),
            ],
          ),
        )
            :
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24,),
                  Text('결제내역',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: text22),),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: size.width,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        for (var year in controller.sortedYears) ...[
                          // 연도 헤더
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              '$year년',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // 해당 연도의 아이템들
                          for (var item in controller.groupedByYear[year]!)
                            GestureDetector(
                              onTap: (){
                                controller.getReceipt(item);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: controller.buildPaymentRow(item),
                              ),
                            ),
                        ],
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
