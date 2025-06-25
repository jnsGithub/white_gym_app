import '../../global.dart';

class PtSchedules {
  getPtSchedules(DateTime now,paymentBranch) async {
    try{
      final firstDayOfMonth = DateTime(now.year, now.month, 1);
      final firstDayOfNextMonth = DateTime(now.year, now.month + 1, 1);
      List pt = [];
      final snapshot =  await ptSchedules
          .where('userDocumentId', isEqualTo: myInfo.documentId)
          .where('trainingType',isEqualTo: 'PT')
          .where('status', whereIn: [0, 1])
          .where('createDate', isGreaterThanOrEqualTo: firstDayOfMonth)
          .where('createDate', isLessThan: firstDayOfNextMonth)
          .get();
      for (var doc in snapshot.docs) {
        final data = doc.data();
        data['documentId'] = doc.id; // 문서 ID 추가
        pt.add(data);
      }
      return pt;
    } catch(e){
      print('Error fetching PT schedules: $e');
      return [];
    }
  }
  changeStatus(String documentId,status) async {
    try {
      await ptSchedules.doc(documentId).update({
        'status': status, // 2는 취소 상태
      });
      myInfo.ptTicket.currentAdmission = myInfo.ptTicket.currentAdmission + 1;
      await userCollection.doc(myInfo.documentId).update({
        'ptTicket': myInfo.ptTicket.toJson(),
      });
      return true;
    } catch (e) {
      print('Error cancelling PT schedule: $e');
      return false;
    }
  }

  addReview(review) async {
    try {
      await staffCollection.doc(review['trainerDocumentId']).collection('review').add(review);
      return true;
    } catch (e) {
      print('Error adding review: $e');
      return false;
    }
  }
  addOtSchedule(otSchedule) async {
    try {
      await ptSchedules.add(otSchedule);
      return true;
    } catch (e) {
      print('Error adding OT schedule: $e');
      return false;
    }
  }
}