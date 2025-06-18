import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:white_gym/app/model/spotItem.dart';

class Ticket {
  final String documentId;
  final String userDocumentId;
  final String spotDocumentId;
  final String paymentBranch;
  final int admission;
  final int lockerNum;
  int pause;
  final bool locker;
  final bool sportswear;
  final bool upgrade;
  bool status;
  final bool subscribe;
  final bool passTicket;
  List<DateTime> pauseStartDate;
  List<DateTime> pauseEndDate;
  DateTime lockerEndDate;
  DateTime sportswearEndDate;
  DateTime endDate;
  final DateTime createDate;
  final SpotItem spotItem;

  Ticket({
    required this.documentId,
    required this.userDocumentId,
    required this.spotDocumentId, // 지점 아이디
    required this.spotItem, //지점 아이템 아이디
    required this.paymentBranch, // 지점명
    required this.admission, // 입장 제한 수
    required this.lockerNum, // 사물함 번호
    required this.pause, // 일시정지
    required this.locker,
    required this.sportswear,
    required this.upgrade, // 업그레이드 여부
    required this.status,
    required this.subscribe,
    required this.passTicket,
    required this.pauseStartDate,
    required this.pauseEndDate,
    required this.lockerEndDate,
    required this.sportswearEndDate,
    required this.createDate,
    required this.endDate,
  });


  factory Ticket.fromJson(Map<String, dynamic> data) {
    // spotItem 처리 등은 기존과 동일하게 처리
    final spotItemData = data['spotItem'];
    if(data['lockerEndDate'] == null && data['locker']){
      data['lockerEndDate'] = data['endDate'];
    } else if( data['lockerEndDate'] == null ){
      data['lockerEndDate'] = Timestamp.fromDate(DateTime(1990, 12, 31));
    }
    if(data['sportswearEndDate'] == null && data['sportswear']){
      data['sportswearEndDate'] = data['endDate'];
    } else if( data['sportswearEndDate'] == null ){
      data['sportswearEndDate'] = Timestamp.fromDate(DateTime(1990, 12, 31));
    }
    final DateTime lockerEnd = (data['lockerEndDate'] as Timestamp).toDate();
    final DateTime sportswearEnd = (data['sportswearEndDate'] as Timestamp).toDate();
    // 오늘 날짜(시·분·초 제외)
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lockerEndDateOnly = DateTime(lockerEnd.year, lockerEnd.month, lockerEnd.day);
    final sportswearEndDateOnly = DateTime(sportswearEnd.year, sportswearEnd.month, sportswearEnd.day);
    final bool lockerValid = !lockerEndDateOnly.isBefore(today);
    final bool sportswearValid = !sportswearEndDateOnly.isBefore(today);

    return Ticket(
      documentId: data['documentId'] as String,
      userDocumentId: data['userDocumentId'] as String,
      spotDocumentId: data['spotDocumentId'] as String,
      spotItem: spotItemData == null
          ? SpotItem.empty()
          : SpotItem.fromJson(spotItemData as Map<String, dynamic>),
      paymentBranch: data['paymentBranch'] as String,
      admission: data['admission'] as int,
      lockerNum: data['lockerNum'] as int,
      pause: data['pause'] as int,
      locker:lockerValid,
      sportswear: sportswearValid,
      upgrade: data['upgrade'] as bool? ?? false, // 업그레이드 여부
      status: data['status'] as bool,
      subscribe: data['subscribe'] as bool,
      passTicket: data['passTicket'] as bool,
      // pauseDate와 pauseEndDate가 없으면 빈 리스트([])를 기본값으로 사용
      pauseStartDate: data['pauseStartDate'] != null ||data['pauseStartDate'].isEmpty
          ? (data['pauseStartDate'] as List<dynamic>)
          .map((e) => (e as Timestamp).toDate())
          .toList()
          : [],
      pauseEndDate: data['pauseEndDate'] != null||data['pauseEndDate'].isEmpty
          ? (data['pauseEndDate'] as List<dynamic>)
          .map((e) => (e as Timestamp).toDate())
          .toList()
          : [],
      lockerEndDate: lockerEnd,
      sportswearEndDate: sportswearEnd,
      endDate: (data['endDate'] as Timestamp).toDate(),
      createDate: (data['createDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'userDocumentId': userDocumentId,
      'spotDocumentId': spotDocumentId,
      'spotItem': spotItem.toJson(),
      'paymentBranch': paymentBranch,
      'admission': admission,
      'lockerNum': lockerNum,
      'pause': pause,
      'locker': locker,
      'sportswear': sportswear,
      'upgrade': upgrade,
      'status': status,
      'subscribe': subscribe,
      'passTicket': passTicket,
      'endDate': endDate,
      'pauseStartDate': pauseStartDate,
      'pauseEndDate': pauseEndDate,
      'lockerEndDate': lockerEndDate,
      'sportswearEndDate': sportswearEndDate,
      'createDate': createDate,
    };
  }

  Ticket copyWith({
    String? documentId,
    String? userDocumentId,
    String? spotDocumentId,
    String? paymentBranch,
    int? admission,
    int? lockerNum,
    int? pause,
    bool? locker,
    bool? sportswear,
    bool? upgrade,
    bool? status,
    bool? subscribe,
    bool? passTicket,
    List<DateTime>? pauseStartDate,
    List<DateTime>? pauseEndDate,
    DateTime? lockerEndDate,
    DateTime? sportswearEndDate,
    DateTime? endDate,
    DateTime? createDate,
  }) {
    return Ticket(
      documentId: documentId ?? this.documentId,
      userDocumentId: userDocumentId ?? this.userDocumentId,
      spotDocumentId: spotDocumentId ?? this.spotDocumentId,
      paymentBranch: paymentBranch ?? this.paymentBranch,
      admission: admission ?? this.admission,
      lockerNum: lockerNum ?? this.lockerNum,
      pause: pause ?? this.pause,
      locker: locker ?? this.locker,
      sportswear: sportswear ?? this.sportswear,
      upgrade: upgrade ?? this.upgrade,
      status: status ?? this.status,
      subscribe: subscribe ?? this.subscribe,
      passTicket: passTicket ?? this.passTicket,
      pauseStartDate: pauseStartDate ?? this.pauseStartDate,
      pauseEndDate: pauseEndDate ?? this.pauseEndDate,
      endDate: endDate ?? this.endDate,
      createDate: createDate ?? this.createDate,
      lockerEndDate: lockerEndDate ?? this.lockerEndDate,
      sportswearEndDate: sportswearEndDate ?? this.sportswearEndDate,
      spotItem: spotItem.copyWith(),
    );
  }


  factory Ticket.empty() {
    return Ticket(
      documentId: '',
      userDocumentId: '',
      spotDocumentId: '',
      paymentBranch: '',
      admission: 0,
      lockerNum: 0,
      pause: 0,
      locker: false,
      sportswear: false,
      upgrade: false,
      status: false,
      subscribe: false,
      passTicket: false,
      pauseStartDate: [],
      endDate: DateTime(1990, 12, 31),
      lockerEndDate: DateTime(1990, 12, 31),
      sportswearEndDate: DateTime(1990, 12, 31),
      pauseEndDate: [],
      createDate: DateTime.now(),
      spotItem: SpotItem.empty(),
    );
  }
}

/// 티켓
///
/// 1. subscribe = false?  =>  검사는 status