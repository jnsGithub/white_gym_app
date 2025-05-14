
import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:white_gym/app/data/userData.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import 'app/model/userData.dart';
import 'package:firebase_auth/firebase_auth.dart';


const mainColor = Color(0xff2969FF);
const bg = Color(0xffF7F7F9);
const text22 = Color(0xff222222);
const text7D = Color(0xff7D8697);
const gray900 = Color(0xff1A1A1A);
const gray800 = Color(0xff303030);
const gray700 = Color(0xff4A4A4A);
const gray600 = Color(0xff636366);
const gray500 = Color(0xff848487);
const gray400 = Color(0xff8E8E93);
const gray300 = Color(0xffAEAEB2);
const gray100 = Color(0xffE5E5EA);
const gray200 = Color(0xffD4D4D4);

final box = GetStorage();

String webApplicationId = '677e31d63aa7c4faf96e5425';
String androidApplicationId = '677e31d63aa7c4faf96e5423';
String iosApplicationId = '677e31d63aa7c4faf96e5424';
String privateKey = 'MpBFUS1+4yl4QLjzeBcFxWNd1KMGEOYxODOKMnki7wU=';
late UserData myInfo;
bool loginState = false;

double baseWidth = 375;
double baseHeight = 812;

String formatNumber(int number) {
  final formatter = NumberFormat('#,###');
  return '${formatter.format(number)} 원';
}

Future<bool> signInAnonymously() async {
  try {
    if( FirebaseAuth.instance.currentUser != null ){
      User? user = FirebaseAuth.instance.currentUser;
      await user?.delete();
      await FirebaseAuth.instance.signOut();
    }
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    print('익명 로그인 성공: ${userCredential.user!.uid}');
    return true; // 익명 사용자 반환
  } catch (e) {
    print('익명 로그인 실패: $e');
    return false;
  }
}

String getDigitsAfterAsterisk(String input) {
  final regex = RegExp(r'\*(\d{3,4})$'); // * 다음 3자리 또는 4자리 추출
  final match = regex.firstMatch(input);

  if (match != null) {
    return match.group(1).toString(); // 그룹 1 (숫자만 반환)
  }
  return ''; // 매칭 실패 시 null 반환
}

void saving(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible:false,
      builder: (BuildContext context) {
        return const AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Center(
              child: CircularProgressIndicator(color: Colors.white,),
            )
        );
      });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void initializeNotification() async {
  if (await Permission.notification.isDenied &&
      !await Permission.notification.isPermanentlyDenied) {
    await [Permission.notification].request();
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  var initializationSettingsAndroid =
  const AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings initializationSettingsIOS =
  DarwinInitializationSettings();
  final InitializationSettings initializationSettings =
  InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(const AndroidNotificationChannel(
      'high_importance_channel', 'high_importance_notification',
      importance: Importance.max));
  await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
          android: AndroidInitializationSettings("@mipmap/ic_launcher"), iOS: DarwinInitializationSettings()
      ));
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    print(message.data);
  });
  FirebaseMessaging.onMessage.listen((event) async {
    RemoteNotification? notification = event.notification;
    if (notification != null) {
      FlutterLocalNotificationsPlugin().show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
            android: AndroidNotificationDetails(
              "show_test",
              "show_test",
              importance: Importance.max,
              priority: Priority.high,
            )
        ),
      );
      flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (payload) async {
        print(event.data);
        // await storage.write(key: 'joinRoom', value: event.data['click_action']);
        // Get.offAll(MainHome());
      });
    }
  });
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

}

Future<void> launchUrl(uri) async {
  Uri _url = Uri.parse(uri);
  if (!await url.launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

void _showUpdateDialog(String updateUrl) {
  try{
    Size size = MediaQuery.of(Get.context!).size;
    showDialog(
      barrierDismissible: false, // 다이얼로그 외부 터치 시 닫히지 않음
      context: Get.context!,
      useRootNavigator: true,
      builder: (_){
        return PopScope(
          canPop: false,
          child: Dialog(
            insetPadding: EdgeInsets.only(left: 24, right: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(top: 42, bottom: 25),
              width: size.width * 0.872,
              height: 294,
              child: Column(
                  children: [
                    Image(image: AssetImage('image/ringing_bell.png',), width: 50, height: 50, fit: BoxFit.cover,),
                    SizedBox(height: 24,),
                    Text('새로운 버전이 출시되었어요!', style: TextStyle(fontSize: size.width * 0.0533, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text('업데이트하고\n최신 버전을 사용해보세요', textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.0373, color: gray400, fontWeight: FontWeight.w500, height: 1.5),),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      ),
                        onPressed: (){
                          launchUrl(updateUrl);
                        },
                        child: Text(
                            '업데이트 하러 가기',
                            style: TextStyle(color: Colors.white, fontSize: size.width * 0.0427, fontWeight: FontWeight.w600)
                        )
                    )
                  ]
              ),

            ),
          ),
        );
      }
      // AlertDialog(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   titlePadding: EdgeInsets.only(top: 42),
      //   contentPadding: EdgeInsets.only(top: 24, bottom: 0),
      //
      //
      //   title: Center(
      //       child: Image(image: AssetImage('image/ringing_bell.png',), width: 50, height: 50, fit: BoxFit.cover,)
      //   ),
      //   content: SizedBox(
      //     // margin: EdgeInsets.only(left: 24, right: 24),
      //     width: 500,
      //     height: 80,
      //     child: Column(
      //       spacing: 8,
      //       children: [
      //         Text('새로운 버전이 출시되었어요!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
      //         Text('업데이트하고\n최신 버전을 사용해보세요', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: gray400, fontWeight: FontWeight.w500),),
      //       ],
      //     ),
      //   ),
      //   actions: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       spacing: 10,
      //       children: [
      //         TextButton(
      //           onPressed: () {
      //             launchUrl(updateUrl);
      //           },
      //           child: const Text('업데이트',style: TextStyle(color: mainColor, fontSize: 16, fontWeight: FontWeight.w600),),
      //         ),
      //       ],
      //     )
      //
      //   ],
      // ),
    );
  }catch(e){
    print('123123');
    print(e);
  }
}

Future currentStoreVersion(String packageName) async {
  try {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if(Platform.isIOS){
      Uri _uri = Uri.https(
        "itunes.apple.com",
        "/lookup",
        {"bundleId": 'com.white.gym.whitegym'},
      );
      final http.Response _response= await http.get(_uri);
      if (_response.statusCode == 200) {
        final jsonObj = json.decode(_response.body);
        String? _version = jsonObj['results'][0]['version'];
        if (_isVersionOlder( packageInfo.version, _version!)) {
          String encodedUrl = Uri.encodeFull("https://apps.apple.com/kr/app/%ED%99%94%EC%9D%B4%ED%8A%B8%EC%A7%90-24%EC%8B%9C%EA%B0%84-%EC%9A%B4%EB%8F%99%ED%8C%8C%ED%8A%B8%EB%84%88/id6741038458");
          _showUpdateDialog(encodedUrl);
          return true;
        }
        return true;
      }
    }
    else if(Platform.isAndroid){
      final http.Response _response = await http.get(
          Uri.parse(
          "https://play.google.com/store/apps/details?id=$packageName"));
      print("https://play.google.com/store/apps/details?id=$packageName");
      if (_response.statusCode == 200) {
        RegExp regexp = RegExp(r'\[\[\[\"(\d+\.\d+(\.[a-z]+)?(\.([^"]|\\")*)?)\"\]\]');
        String? _version = regexp.firstMatch(_response.body)?.group(1);
        print(_version);
        print(packageInfo.version);
        if (_isVersionOlder(packageInfo.version, _version!)) {
          print(1234);
          _showUpdateDialog("https://play.google.com/store/apps/details?id=$packageName");
          print(123);
          return true;
        }
        return true;
      }
    }
  } catch (e) {
    print(e);
    return false;
  }
}
bool _isVersionOlder(String current, String latest) {
  try{
    List<int> currentParts = current.split('.').map(int.parse).toList();
    List<int> latestParts = latest.split('.').map(int.parse).toList();
    print(currentParts);
    print(latestParts);

    for (int i = 0; i < latestParts.length; i++) {
      if (i >= currentParts.length) {
        return true;
      }
      if (latestParts[i] > currentParts[i]) {
        return true;
      } else if (latestParts[i] < currentParts[i]) {
        return false;
      }
    }
    return false;
  } catch(e){
    print(e);
    return false;
  }

}