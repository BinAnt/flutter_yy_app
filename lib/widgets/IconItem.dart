/*
 * @Author: liubin
 * @Date: 2023-11-21 14:47:43
 * @LastEditTime: 2023-11-22 10:05:56
 * @LastEditors: liubin
 * @Description: 
 * @FilePath: \flutterDemo\hyt_app\lib\widgets\IconItem.dart
 */
import 'package:flutter/material.dart';

class IconItem extends StatelessWidget {
  final String icon;
  final String title;
  final double width = 30.0;
  final double height = 30.0;
  
  const IconItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Image.asset(icon, width: width, height: height),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
