import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'route.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialRoute: '/',
      getPages: AscentRoutes.getPages,
      title: "nhentai_searcher",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),
    );
  }
}
