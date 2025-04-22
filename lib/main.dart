import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:white_gym/app/data/userData.dart';

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
    print('1 : $autoLogin');
    if(await box.read('documentId')!=null){
      print('2 : $autoLogin');
      if(await userDataRepository.autoLogin()){
        print(await userDataRepository.autoLogin());
        print('3 : $autoLogin');
        if(myInfo.ticket.endDate.isBefore(DateTime.now().add(Duration(days: -1)))){
          print('4 : $autoLogin');
          DateTime end = myInfo.ticket.pauseEndDate.isNotEmpty ? myInfo.ticket.pauseEndDate.last : myInfo.ticket.endDate;
          // DateTime end = myInfo.ticket.pauseEndDate.last;
          DateTime endOfDay = DateTime(end.year, end.month, end.day, 23, 59, 59);
          if(myInfo.ticket.status == false && DateTime.now().isBefore(endOfDay)){
            print('5 : $autoLogin');
            autoLogin = Routes.MAIN_HOME;
          } else {
            print('6 : $autoLogin');

            autoLogin = Routes.GYM_LIST;
          }
        } else {
          print('7 : $autoLogin');

          autoLogin = Routes.MAIN_HOME;
        }
        print('8 : $autoLogin');

      }
      print('9 : $autoLogin');
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
  // }


  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: autoLogin,
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
          )
      ),
    ),
  );
  if(!a){
    Future.delayed(Duration(seconds: 1),() {
      Get.snackbar('인터넷 연결 실패', '인터넷 상태를 확인해주세요.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);

    },);
  }
  // Future.delayed(Duration(seconds: 1),() async {
  //   if(await currentStoreVersion('com.white.gym.app.white_gym')){
  //     print('업데이트 필요');
  //   }
  // },);

}
