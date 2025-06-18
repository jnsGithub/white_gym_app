import 'package:get/get.dart';
import '../../../../global.dart';
import '../../../data/spot.dart';
import '../../../model/spot.dart';
import '../../../model/spotItem.dart';

class UpgradeController extends GetxController {

  RxList<SpotItem> spotItemList = <SpotItem>[].obs;
  SpotDataRepository spotDataRepository = SpotDataRepository();
  late Spot spot;

  @override
  void onInit() {
    super.onInit();
  }
  getItem() async {
    spotItemList.clear();
    spot = await spotDataRepository.getSpotOne(myInfo.ticket.spotDocumentId);
    List<SpotItem> a  = await spotDataRepository.getSpotItem(myInfo.ticket.spotDocumentId);
    for(var i in a){
      if(i.passTicket == myInfo.ticket.passTicket){
        spotItemList.add(i);
      }
    }
  }
}