import 'package:get/get.dart';
import 'package:search_nhentai/HomePage.dart';
import 'package:search_nhentai/ImageList.dart';

class AscentRoutes {
  static final List<GetPage> getPages = [
    GetPage(
        name: "/",
        page: () => HomeScreen()
    ),
    GetPage(
      name: "/ImageList",
      page: () => ImageList(),
    )
  ];
}
