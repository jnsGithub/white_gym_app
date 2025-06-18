import 'package:get/get.dart';
import 'package:white_gym/app/model/spotItem.dart';

import '../../../../global.dart';
import '../../../data/spot.dart';
import '../../../model/spot.dart';

class MyPageController extends GetxController {
  //TODO: Implement MyPageController

  final count = 0.obs;
  RxBool isDone = false.obs;
  RxList<SpotItem> spotItemList = <SpotItem>[].obs;
  SpotDataRepository spotDataRepository = SpotDataRepository();
  late Spot spot;
  @override
  void onInit() {
    super.onInit();
    isDone.value = myInfo.ticket.endDate.isBefore(DateTime.now().add(Duration(days: -1)));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getItem() async {
    spotItemList.clear();
    spot = await spotDataRepository.getSpotOne(myInfo.ticket.spotDocumentId);
    List<SpotItem> a  = await spotDataRepository.getSpotItem(myInfo.ticket.spotDocumentId);
    for(var i in a){
      if(i.passTicket == myInfo.ticket.passTicket && i.isSubscribe == myInfo.ticket.subscribe){
        spotItemList.add(i);
      }
    }
  }
}
