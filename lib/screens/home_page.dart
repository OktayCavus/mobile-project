import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/controller/home_controller.dart';
import 'package:mobile_project/screens/drawer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Önerilen yemek'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Obx(() {
          if (controller.meals.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var meal = controller.meals[0];
            var ingredientsAndMeasures =
                controller.getIngredientsAndMeasures(meal);
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: SizedBox(
                      height: Get.height * .4,
                      width: Get.width,
                      child: Image.network(
                        meal.strMealThumb!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  buildRow('Yemek Adı: ', meal.strMeal ?? ''),
                  const SizedBox(height: 8),
                  buildRow('Yemek Kategorisi: ', meal.strCategory ?? ''),
                  const SizedBox(height: 8),
                  buildRow('Yemeğin Ülkesi: ', meal.strArea ?? ''),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'Yemek İçeriği',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...ingredientsAndMeasures.map((item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 25),
                        ),
                      )),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Row buildRow(String text, String data) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            data,
            style: const TextStyle(fontSize: 28),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
