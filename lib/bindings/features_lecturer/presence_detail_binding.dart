import 'package:get/get.dart';
import 'package:stipres/controllers/features_lecturer/presences/presence_detail_controller.dart';

class PresenceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PresenceDetailController());
  }
}
