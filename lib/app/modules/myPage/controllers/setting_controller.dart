import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_gym/app/data/userData.dart';
import 'package:white_gym/global.dart';

import '../../../routes/app_pages.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController
  RxBool pushCheck = myInfo.pushAlarm.obs;
  RxBool smsCheck= false.obs;
  final count = 0.obs;

  UserDataRepository userDataRepository = UserDataRepository();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  accountDeletion() async {
    Size size = MediaQuery.of(Get.context!).size;
    Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          actionsPadding: EdgeInsets.zero,
          titlePadding: const EdgeInsets.only(top: 30),
          contentPadding: const EdgeInsets.only(top: 8, bottom: 23),
          title: const Text(
            '회원 탈퇴 하시겠습니까?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,height: 1.5,color: text22),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '(회원 탈퇴 후에는 회원정보, 결제내역,\n보유 상품 복구/환불이 불가능합니다.)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffFF3C3C),fontSize: 13,fontWeight: FontWeight.w500),
              ),
            ],
          ),
          actions: [
            Container(
              width: size.width,
              height: 48.1,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffe0e0e0),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffe0e0e0),
                              width: 1,
                            ),
                          ),
                        ),
                        child: const Text(
                          '취소',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        Get.back();
                        Get.snackbar('회원 탈퇴 오류', '현재 구독중인 이용권이 있어, 회원 탈퇴가 불가능합니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
                        bool check = await userDataRepository.deleteUserData();
                        if(check) {
                          await FirebaseAuth.instance.signOut();
                          box.remove('documentId');
                          Get.offAllNamed(Routes.HOME);
                          Get.snackbar('알림', '회원탈퇴가 완료되었습니다.'
                              ,backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
                        } else {
                          Get.back();
                          Get.snackbar('알림', '회원탈퇴 실패하였습니다.'
                              ,backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
                        }
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFF3C3C),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
  logout() async {
    Size size = MediaQuery.of(Get.context!).size;
    Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          actionsPadding: EdgeInsets.zero,
          titlePadding: const EdgeInsets.only(top: 50, bottom: 40),
          title: const Text(
            '로그아웃 하시겠습니까?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,height: 1.5,color: text22),
          ),
          actions: [
            Container(
              width: size.width,
              height: 48.1,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffe0e0e0),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffe0e0e0),
                              width: 1,
                            ),
                          ),
                        ),
                        child: const Text(
                          '취소',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        User? user = FirebaseAuth.instance.currentUser;
                        await user?.delete();
                        await FirebaseAuth.instance.signOut();
                        loginState = false;
                        box.remove('documentId');
                        Get.offAllNamed(Routes.HOME);
                        Get.snackbar('알림', '로그아웃이 완료되었습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
                      },
                      child: Container(
                        height: 48.1,
                        alignment: Alignment.center,
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
