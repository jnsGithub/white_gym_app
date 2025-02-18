
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:white_gym/app/data/userData.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import 'app/model/userData.dart';
import 'package:firebase_auth/firebase_auth.dart';


const mainColor = Color(0xff2969FF);
const bg = Color(0xffF7F7F9);
const text22 = Color(0xff222222);
const text7D = Color(0xff7D8697);
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
String formatNumber(int number) {
  final formatter = NumberFormat('#,###');
  return '${formatter.format(number)} 원';
}

Future<User?> signInAnonymously() async {
  try {
    if( FirebaseAuth.instance.currentUser != null ){
      User? user = FirebaseAuth.instance.currentUser;
      await user?.delete();
      await FirebaseAuth.instance.signOut();
    }
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    print('익명 로그인 성공: ${userCredential.user!.uid}');
    return userCredential.user; // 익명 사용자 반환
  } catch (e) {
    print('익명 로그인 실패: $e');
    Get.snackbar('로그인 실패', '로그인에 실패했습니다.',backgroundColor: Colors.white,colorText:text22,borderRadius:16,borderColor: gray700,borderWidth: 1);
    return null;
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