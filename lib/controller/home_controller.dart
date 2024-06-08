import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_project/model/category_model.dart';
import 'package:mobile_project/model/suggestion_model.dart';

class HomeController extends GetxController {
  RxList<Meal> meals = <Meal>[].obs;
  RxList<Category> category = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSuggestionMenu();
    fetchAllCategory();
  }

  fetchSuggestionMenu() async {
    try {
      var request = await http
          .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
      if (request.statusCode == 200) {
        var response = suggestionMealModelFromJson(request.body);
        meals.value = response.meals ?? [];
      } else {
        print('----: ${request.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  List<String> getIngredientsAndMeasures(Meal meal) {
    List<String> ingredientsAndMeasures = [];
    for (int i = 1; i <= 20; i++) {
      String? ingredient = meal.ingredients['strIngredient$i'];
      String? measure = meal.ingredients['strMeasure$i'];
      if (ingredient != null &&
          ingredient.isNotEmpty &&
          measure != null &&
          measure.isNotEmpty) {
        ingredientsAndMeasures.add('$ingredient: $measure');
      }
    }
    return ingredientsAndMeasures;
  }

  fetchAllCategory() async {
    try {
      var request = await http.get(
          Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?c=list'));
      if (request.statusCode == 200) {
        var response = categoryModelFromJson(request.body);
        category.value = response.meals ?? [];
      } else {
        print('--- ${request.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
