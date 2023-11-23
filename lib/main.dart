/*
 * @Author: liubin
 * @Date: 2023-11-10 11:27:23
 * @LastEditTime: 2023-11-23 14:15:40
 * @LastEditors: liubin
 * @Description: 
 * @FilePath: \flutterDemo\hyt_app\lib\main.dart
 */
import 'package:flutter/material.dart';
import 'package:hyt_app/common/HexColor.dart';
import 'package:hyt_app/widgets/CardBox.dart';
import 'package:hyt_app/widgets/FindDeptWidget.dart';
import 'package:hyt_app/widgets/HomeCommonCard.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:hyt_app/widgets/IconItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xx大学xx医院',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(58, 211, 193, 1)),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('xx大学xx医院'),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: const Color.fromRGBO(58, 211, 193, 1), // 顶部导航背景颜色
        ),
        body: const HomePage(),
        // scaffold包括AppBar和Body的背景颜色
        backgroundColor: const Color.fromRGBO(245, 246, 247, 1),
      ),
    );
  }
}

// 首页
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: const EdgeInsets.all(15),
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Column(children: [
                const CardBox(),
                SizedBox(
                  height: 100,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('banner导航'),
                    ),
                  ),
                ),
                const HomeCommonCard(
                    title: '找科室',
                    isShowRightArrow: true,
                    child: FindDeptWidget()),
                const HomeCommonCard(
                  title: '门诊服务',
                  isShowRightArrow: false,
                  child: Text('主要内容'),
                ),
                const HomeCommonCard(
                  title: '住院服务',
                  isShowRightArrow: false,
                  child: Text('主要内容'),
                ),
              ]),
            )));
  }
}

class $ {}
