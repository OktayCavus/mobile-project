import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_project/model/detail_model.dart';

class DetailController extends GetxController {
  dynamic argumentData = Get.arguments;
  RxString id = ''.obs;
  RxString name = ''.obs;
  var meals = <Meal>[].obs;

  @override
  void onInit() {
    super.onInit();
    id.value = argumentData[0]['id'];
    name.value = argumentData[0]['name'];
    fetchMealDetail();
  }

  void fetchMealDetail() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/lookup.php?i=${id.value}'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        Meal meal = Meal.fromJson(jsonResponse['meals'][0]);
        meals.add(meal);
      } else {
        Get.snackbar('Error', 'Failed to fetch meal details');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch meal details');
    }
  }

  List<String> getIngredientsAndMeasures(Meal meal) {
    List<String> ingredientsAndMeasures = [];
    for (int i = 1; i <= 20; i++) {
      String? ingredient = meal.toJson()['strIngredient$i'];
      String? measure = meal.toJson()['strMeasure$i'];
      if (ingredient != null &&
          ingredient.isNotEmpty &&
          measure != null &&
          measure.isNotEmpty) {
        ingredientsAndMeasures.add('$measure $ingredient');
      }
    }
    return ingredientsAndMeasures;
  }
}
