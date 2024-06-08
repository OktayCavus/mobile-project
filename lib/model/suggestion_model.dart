import 'dart:convert';

SuggestionMealModel suggestionMealModelFromJson(String str) =>
    SuggestionMealModel.fromJson(json.decode(str));

String suggestionMealModelToJson(SuggestionMealModel data) =>
    json.encode(data.toJson());

class SuggestionMealModel {
  final List<Meal>? meals;

  SuggestionMealModel({
    this.meals,
  });

  factory SuggestionMealModel.fromJson(Map<String, dynamic> json) =>
      SuggestionMealModel(
        meals: json["meals"] == null
            ? []
            : List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": meals == null
            ? []
            : List<dynamic>.from(meals!.map((x) => x.toJson())),
      };
}

class Meal {
  final String? idMeal;
  final String? strMeal;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final Map<String, String?> ingredients;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    final ingredients = <String, String?>{};
    for (int i = 1; i <= 20; i++) {
      ingredients['strIngredient$i'] = json['strIngredient$i'];
      ingredients['strMeasure$i'] = json['strMeasure$i'];
    }
    return Meal(
      idMeal: json["idMeal"],
      strMeal: json["strMeal"],
      strCategory: json["strCategory"],
      strArea: json["strArea"],
      strInstructions: json["strInstructions"],
      strMealThumb: json["strMealThumb"],
      strTags: json["strTags"],
      strYoutube: json["strYoutube"],
      ingredients: ingredients,
    );
  }

  Map<String, dynamic> toJson() => {
        "idMeal": idMeal,
        "strMeal": strMeal,
        "strCategory": strCategory,
        "strArea": strArea,
        "strInstructions": strInstructions,
        "strMealThumb": strMealThumb,
        "strTags": strTags,
        "strYoutube": strYoutube,
        for (int i = 1; i <= 20; i++)
          'strIngredient$i': ingredients['strIngredient$i'],
        for (int i = 1; i <= 20; i++)
          'strMeasure$i': ingredients['strMeasure$i'],
      };
}
