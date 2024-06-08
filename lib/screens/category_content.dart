import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/controller/category_content_controller.dart';

class CategoryContent extends GetView<CategoryContentController> {
  const CategoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.c.value),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.meals.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.meals.length,
            itemBuilder: (context, index) {
              var meal = controller.meals[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Image.network(meal.strMealThumb ?? ''),
                  title: Text(meal.strMeal ?? ''),
                  onTap: () {
                    Get.toNamed('/detail', arguments: [
                      {'id': meal.idMeal, 'name': meal.strMeal}
                    ]);
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
