import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_project/model/category_content_model.dart';

class CategoryContentController extends GetxController {
  dynamic argumentData = Get.arguments;
  RxList<Meal> meals = <Meal>[].obs;
  RxString url = ''.obs;
  RxString c = ''.obs;
  fetchAllMeals() async {
    url.value =
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=${c.value}';
    try {
      var request = await http.get(Uri.parse(url.value));
      if (request.statusCode == 200) {
        var response = mealFromJson(request.body);
        meals.value = response;
      } else {
        print('-----: ${request.statusCode}');
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    c.value = argumentData[0]['c'];
    fetchAllMeals();
  }
}
