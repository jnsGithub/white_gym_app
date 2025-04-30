import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/payment.dart';

import '../../../../global.dart';
import '../../../model/payment_item/payment_item.dart';

class PaymentListController extends GetxController {
  //TODO: Implement PaymentListController

  RxList<PaymentItem> paymentList = <PaymentItem>[].obs;
  RxList<int> sortedYears = <int>[].obs;
  RxBool isLoading = true.obs;

  DateTime now = DateTime.now();

  Map<int, RxList<PaymentItem>> groupedByYear = {};
  PaymentsRepository payments = PaymentsRepository();
  @override
  void onInit() {
    super.onInit();
    init();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  init() async {
    paymentList.value = await payments.getPayment();
    paymentList.sort((a, b) => b.crateDate.compareTo(a.crateDate));
    for (var item in paymentList) {
      final year = item.crateDate.year;
      if (!groupedByYear.containsKey(year)) {
        groupedByYear[year] = <PaymentItem>[].obs;
      }
      groupedByYear[year]!.add(item);
    }
    sortedYears.value = groupedByYear.keys.toList()..sort((b, a) => a.compareTo(b));
    isLoading.value = false;
  }
  getReceipt(PaymentItem item){
    Size size = MediaQuery.of(Get.context!).size;
    Get.bottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          // 여기서 상단 모서리만 둥글게
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        SizedBox(
          height: size.height*0.8,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0),),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('영수증',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: text22),),
                  SizedBox(height: 22),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('총 결제 금액',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: text22),),
                        Text(formatNumber(item.receipt.price ),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: mainColor),),
                      ],
                    ),
                  ),
                  Container(width: size.width, height: 1, decoration: BoxDecoration(color: text22,),),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.receipt.orderName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text(formatNumber(item.ticketPrice  - item.locker - item.sportswear),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('개인 락커',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text(formatNumber(item.locker),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('회원복',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text(formatNumber(item.sportswear),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('결제지점',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text(item.paymentBranch,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('결제일자',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text('${item.crateDate.year}-${item.crateDate.month}-${item.crateDate.day < 10 ?'0${item.crateDate.day}':item.crateDate.day}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('할부기간',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text(item.receipt.cardData.cardQuota =='00'?'일시불':'${item.receipt.cardData.cardQuota} 개월',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('대표자명',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text('문배영',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('사업자번호',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text('3708603195',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('판매자상호',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text('주식회사 브랜드원',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('사업장주소',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text('서울 강남구 논현로 319, 1층',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('전화번호',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text7D),),
                        Text('02-556-9688',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: text22),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
  Widget buildPaymentRow(PaymentItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 첫째 줄: title + price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.receipt.orderName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              formatNumber(item.receipt.price), // 금액 포맷 함수
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // 둘째 줄: 날짜
        Text(
          '${item.crateDate.month}월 ${item.crateDate.day < 10 ? '0${item.crateDate.day}' : item.crateDate.day}일',
          style: TextStyle(fontSize: 14, color: Color(0xffA5ADBE)),
        ),
      ],
    );
  }
}
