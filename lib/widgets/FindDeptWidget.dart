// ignore_for_file: unused_local_variable

/*
 * @Author: liubin
 * @Date: 2023-11-21 17:20:50
 * @LastEditTime: 2023-11-22 21:11:41
 * @LastEditors: liubin
 * @Description: 
 * @FilePath: \flutterDemo\hyt_app\lib\widgets\FindDeptWidget.dart
 */
import 'dart:developer';
import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hyt_app/common/HexColor.dart';
import 'package:hyt_app/widgets/IconItem.dart';

class CustomSwiperPaginationBuilder extends SwiperPlugin {
  // 当滚动到此时的颜色
  late Color? activeColor;

  // 默认颜色
  late Color? color;

  // 每个圆点的间距
  final double space;

  // 每个圆点的大小
  final double size;

  // 特殊点的宽度
  final double activeSize;

  final Key? key;

  CustomSwiperPaginationBuilder(
      {this.color = const Color.fromRGBO(50, 185, 170, 0.30),
      this.activeColor = const Color.fromRGBO(50, 185, 170, 1),
      this.space = 2.0,
      this.size = 4.0,
      this.activeSize = 12,
      this.key});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    // 处理边界情况
    int activeIndex = config.activeIndex;
    // 用于存放小圆点
    List<Widget> list = [];
    for (var i = 0; i < config.itemCount; ++i) {
      if (activeIndex == i) {
        list.add(Container(
            key: Key('pagination_$i'),
            margin: EdgeInsets.all(space),
            child: PhysicalModel(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: Container(
                color: activeColor,
                width: activeSize,
                height: size,
              ),
            )));
      } else {
        list.add(Container(
          key: Key('pagination_$i'),
          margin: EdgeInsets.all(space),
          child: ClipOval(
            // 圆角组件
            child: Container(
              color: color,
              width: size,
              height: size,
            ),
          ),
        ));
      }
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
            left: 0,
            right: 0,
            bottom: -10,
            child: Row(
              key: key,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            ))
      ],
    );
  }
}

class FindDeptWidget extends StatefulWidget {
  const FindDeptWidget({super.key});

  @override
  State<FindDeptWidget> createState() => _nameState();
}

const List<String> titles = [
  'Flutter Swiper is awesome',
  'Really nice',
  'Yeah'
];

List<Map<String, dynamic>> findDepts = [
  {'title': '神经外科', 'icon': 'images/icon_1.png', 'sort': 0},
  {'title': '神经内科', 'icon': 'images/icon_2.png', 'sort': 1},
  {'title': '消化内科', 'icon': 'images/icon_3.png', 'sort': 2},
  {'title': '神经外科', 'icon': 'images/icon_4.png', 'sort': 3},
  {'title': '康复医学科', 'icon': 'images/icon_5.png', 'sort': 4},
  {'title': '康复医学科', 'icon': 'images/icon_6.png', 'sort': 5},
  {'title': '康复医学科', 'icon': 'images/icon_7.png', 'sort': 6},
  {'title': '康复医学科', 'icon': 'images/icon_8.png', 'sort': 7},
];

const List<Widget> images = [
  IconItem(title: '神经外科', icon: 'images/icon_1.png'),
  IconItem(title: '神经内科', icon: 'images/icon_2.png'),
  IconItem(title: '消化内科', icon: 'images/icon_3.png'),
  IconItem(title: '康复医学科', icon: 'images/icon_4.png'),
  IconItem(title: '康复医学科', icon: 'images/icon_6.png'),
  IconItem(title: '康复医学科', icon: 'images/icon_7.png'),
  IconItem(title: '康复医学科', icon: 'images/icon_8.png'),
];

class _nameState extends State<FindDeptWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(top: 11),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            // return images[index];
            print(index);
            print((findDepts[0]['sort'] / 4).toInt() == index);
            print((findDepts[1]['sort'] / 4).toInt() == index);

            const List<Widget> list = [];
            for (var widget in List.generate(
                5,
                (index) => Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                      ),
                    ))) {
              list.add(widget);
            }

            return const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: list,
            );
          },
          itemCount: 2,
          pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: CustomSwiperPaginationBuilder()),
        ),
      ),
    );
  }
}
