import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../../global.dart';
import '../model/spot.dart';

class SendEmail{
  final String senderMail = 'whitegym.ot.confirm@gmail.com';
  final String password = 'keahpviocwlgxeov';
  final String receiverMail = '';


  // 1) SMTP 서버 설정 (예: Gmail SMTP)
  // final smtpServer = SmtpServer(
  //   'smtp.gmail.com',
  //   port: 587,
  //   username: 'whitegym.ot.confirm@gmail.com',
  //   password: password, // Gmail의 경우 App Password 사용 권장
  //   ignoreBadCertificate: false,
  // );

// 2) 이메일 전송 함수
  Future<bool> sendEmail(Spot spot, int index, String selectedTime) async {
    final db = await FirebaseFirestore.instance.collection('pt_email').doc('email').get();
    String receiverMail = db.data()!['email'] ?? '';

    final message = Message()
      ..from = Address(senderMail, '${myInfo.name}님의 OT 신청')
      ..recipients.add(receiverMail)
      ..subject = '(${spot.name}) OT 신청 : ${myInfo.name}님'
      ..html =
      '''
      <p>
  <span style="color:blue; font-size:24px; font-weight:bold;">${myInfo.name}</span>
  <span style="font-size:18px;">님이</span>
  <span style="color:blue; font-size:24px; font-weight:bold;">${spot.name}</span>
  <span style="font-size:18px;">에 OT 신청을 하셨습니다.</span>
</p>
<br><br>
<p>
  <b style="font-size:24px; ">회원&nbsp;이름 : </b><span style="color:blue; font-size:24px; font-weight:bold;">${myInfo.name}</span><br><br>
  <b style="font-size:24px; ">신청&nbsp;지점 : </b><span style="color:blue; font-size:24px; font-weight:bold;">${spot.name}</span><br><br>
  <b style="font-size:24px; ">희망&nbsp;시간 : </b><span style="color:blue; font-size:24px; font-weight:bold;">${selectedTime}</span><br><br>
  <b style="font-size:24px; ">전화번호&nbsp; : </b><span style="color:blue; font-size:24px; font-weight:bold;">${myInfo.phone}</span><br><br>
  <b style="font-size:24px; ">소속&nbsp;지점 : </b><span style="color:blue; font-size:24px; font-weight:bold;">${myInfo.ticket.paymentBranch}</span><br><br>
  
  <b>신청 버튼 누른 시간 : </b>${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}
</p>
<br><br><br><br>
<p>${myInfo.documentId}</p>
      ''';

    try {
      final sendReport = await send(message, SmtpServer(
        'smtp.gmail.com',
        port: 587,
        username: senderMail,
        password: password, // Gmail의 경우 App Password 사용 권장
        ignoreBadCertificate: false,
      ));
      print('메일 전송 성공: ' + sendReport.toString());
      return true;
    } on MailerException catch (e) {
      print('메일 전송 실패: $e');
      return false;
    }
  }
}

