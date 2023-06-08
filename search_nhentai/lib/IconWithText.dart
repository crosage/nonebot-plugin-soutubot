//无法自动换行

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget{
  final RawChip flexIcon;
  final String flexText;
  IconWithText({required this.flexText,required this.flexIcon});
  @override
  Widget build(BuildContext context){
    return               Container(
      width: MediaQuery.of(context).size.width-200, // 设置容器宽度为屏幕宽度
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          flexIcon,
          Expanded(
            child: Text(
              flexText,
              softWrap: true, // 允许文本换行
            ),
          ),
        ],
      ),
    );
  }
}