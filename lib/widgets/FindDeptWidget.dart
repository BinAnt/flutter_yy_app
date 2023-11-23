// ignore_for_file: unused_local_variable

/*
 * @Author: liubin
 * @Date: 2023-11-21 17:20:50
 * @LastEditTime: 2023-11-23 18:10:05
 * @LastEditors: liubin
 * @Description: 
 * @FilePath: \flutterDemo\hyt_app\lib\widgets\FindDeptWidget.dart
 */
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

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
            bottom: -15,
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

List<Map<String, dynamic>> list = [
  {'title': '神经外科', 'icon': 'images/icon_1.png', 'sort': 0},
  {'title': '神经内科', 'icon': 'images/icon_2.png', 'sort': 1},
  {'title': '消化内科', 'icon': 'images/icon_3.png', 'sort': 2},
  {'title': '神经外科', 'icon': 'images/icon_4.png', 'sort': 3},
  {'title': '眼科', 'icon': 'images/icon_5.png', 'sort': 4},
  {'title': '泌尿科', 'icon': 'images/icon_6.png', 'sort': 5},
  {'title': '耳鼻喉', 'icon': 'images/icon_7.png', 'sort': 6},
  {'title': '骨科', 'icon': 'images/icon_8.png', 'sort': 7},
];

class _nameState extends State<FindDeptWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(top: 6),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: list.where((item) => item['sort'] ~/ 4 == index).map((item) {
                var i = item['sort'];
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.12,
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: Image.asset(
                                  'images/icon_${(i+1)}.png',
                                  width: 30,
                                  height: 30),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(item['title']),
                      )
                    ],
                  ),
                );
              }).toList(),
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
