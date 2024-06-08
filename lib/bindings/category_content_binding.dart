import 'package:get/get.dart';
import 'package:mobile_project/controller/category_content_controller.dart';

class CategoryContentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryContentController());
  }
}
