import 'dart:math';

import 'package:flutter/material.dart';

List<String> imagePaths = [
  'assets/1.jpg',
  'assets/2.png',
  'assets/3.png',
];

class helper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomIndex = random.nextInt(imagePaths.length);
    String randomImagePath = imagePaths[randomIndex];
    return AlertDialog(
        content: Container(
      width: 200,
      child: ListView(
        children: [
          Row(
            children: [Text("使用帮助")],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.photo_size_select_actual
              ), SizedBox(width: 20,),Text("选择你要搜索的图片")],

          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [Icon(Icons.search,color: Colors.amber,),SizedBox(width: 20,), Text("等待返回结果回传")],
          ),
          Row(
            children: [
              Flexible(child: Image(image: AssetImage(randomImagePath))),
            ],
          ),
        ],
      ),
    ));
  }
}
