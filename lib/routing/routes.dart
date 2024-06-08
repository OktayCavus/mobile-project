import 'package:get/get.dart';
import 'package:mobile_project/bindings/category_content_binding.dart';
import 'package:mobile_project/bindings/detail_binding.dart';
import 'package:mobile_project/bindings/home_binding.dart';
import 'package:mobile_project/screens/category_content.dart';
import 'package:mobile_project/screens/detail.dart';
import 'package:mobile_project/screens/home_page.dart';

routes() => [
      GetPage(
        name: '/home',
        page: () => const HomePage(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: '/content',
        page: () => const CategoryContent(),
        binding: CategoryContentBinding(),
      ),
      GetPage(
        name: '/detail',
        page: () => const DetailScreen(),
        binding: DetailBinding(),
      ),
    ];
