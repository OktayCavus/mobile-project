import 'package:get/get.dart';
import 'package:mobile_project/controller/detail_controller.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
  }
}
