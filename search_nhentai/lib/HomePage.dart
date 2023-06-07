import 'package:flutter/material.dart';
import 'package:search_nhentai/Helper.dart';
import 'package:search_nhentai/UploadImage.dart';
import 'dart:math';
List<String> imagePaths = [
  'assets/1.jpg',
  'assets/2.png',
  'assets/3.png',
];
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("nhentai_searcher"),
        ),
        body:
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  IconButton(
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return helper();
                            }
                        );
                      },
                      icon: Icon(Icons.help)
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child:UploadImage()),
                  ]
              ),
            ]
        )
    );
  }
}