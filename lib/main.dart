import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/bindings/home_binding.dart';
import 'package:mobile_project/routing/routes.dart';
import 'package:mobile_project/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: routes(),
      initialBinding: HomeBinding(),
      home: const HomePage(),
    );
  }
}
