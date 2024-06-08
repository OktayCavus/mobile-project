import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/controller/home_controller.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<StatefulWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(),
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Kategoriler",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            if (homeController.category.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: ListView.builder(
                  itemCount: homeController.category.length,
                  itemBuilder: (context, index) {
                    var category = homeController.category[index];
                    return ListTile(
                      title: Text(category.strCategory ?? ''),
                      trailing: const Icon(Icons.arrow_right),
                      onTap: () {
                        Get.toNamed('/content', arguments: [
                          {"c": category.strCategory},
                        ]);
                      },
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
