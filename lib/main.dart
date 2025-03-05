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
  // initializeNotification();
  UserDataRepository userDataRepository = UserDataRepository();
  await signInAnonymously();
  if (box.read('documentId')!=null) {
    if(await userDataRepository.autoLogin()){
      if(myInfo.ticket.endDate.isBefore(DateTime.now().add(Duration(days: -1)))){
        autoLogin = Routes.GYM_LIST;
      } else {
        autoLogin = Routes.MAIN_HOME;
      }
    }
  }
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
}
