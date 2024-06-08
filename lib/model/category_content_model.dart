import 'dart:convert';

List<Meal> mealFromJson(String str) =>
    List<Meal>.from(json.decode(str)["meals"].map((x) => Meal.fromJson(x)));

String mealToJson(List<Meal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Meal {
  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
