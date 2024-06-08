import 'dart:convert';

// JSON string'ini CategoryModel objesine dönüştüren fonksiyon
CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

// CategoryModel objesini JSON string'ine dönüştüren fonksiyon
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final List<Category>? meals;

  CategoryModel({this.meals});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        meals: json["meals"] == null
            ? []
            : List<Category>.from(
                json["meals"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": meals == null
            ? []
            : List<dynamic>.from(meals!.map((x) => x.toJson())),
      };
}

class Category {
  final String? strCategory;

  Category({this.strCategory});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        strCategory: json["strCategory"],
      );

  Map<String, dynamic> toJson() => {
        "strCategory": strCategory,
      };
}
