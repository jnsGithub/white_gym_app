import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:white_gym/app/data/userData.dart';

import 'app/modules/block/views/block_view.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'global.dart';
String autoLogin = Routes.HOME;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('ko_KR', null);

  FirebaseAuth.instance.setLanguageCode("ko");
  initializeNotification();



bool a = await signInAnonymously();
  UserDataRepository userDataRepository = UserDataRepository();
  if(a){
    if(await box.read('documentId')!=null){
      if(await userDataRepository.autoLogin()){
        if(myInfo.ticket.endDate.isBefore(DateTime.now().add(Duration(days: -1)))){
          DateTime end = myInfo.ticket.pauseEndDate.isNotEmpty ? myInfo.ticket.pauseEndDate.last : myInfo.ticket.endDate;
          // DateTime end = myInfo.ticket.pauseEndDate.last;
          DateTime endOfDay = DateTime(end.year, end.month, end.day, 23, 59, 59);
          if(myInfo.ticket.status == false && DateTime.now().isBefore(endOfDay)){
            autoLogin = Routes.MAIN_HOME;
          } else {
            autoLogin = Routes.GYM_LIST;
          }
        } else {
          autoLogin = Routes.MAIN_HOME;
        }
      }
    }
  }
  // if (box.read('documentId')!=null) {
  //   if(await userDataRepository.autoLogin()){
  //     if(myInfo.ticket.endDate.isBefore(DateTime.now().add(Duration(days: -1)))){
  //       autoLogin = Routes.GYM_LIST;
  //     } else {
  //       autoLogin = Routes.MAIN_HOME;
  //     }
  //   }
  // }ㄴ


  runApp(
    GetMaterialApp(
      // home: BlockView(),
      title: "Application",
      initialRoute: autoLogin,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling), // 고정
          child: child!,
        );
      },
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              backgroundColor:  Colors.white,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400
              ), elevation:0
          ),
      ),
    ),
  );
  if(!a){
    Future.delayed(Duration(seconds: 1),() {
      Get.snackbar('인터넷 연결 실패', '인터넷 상태를 확인해주세요.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
    },);
  }
}
