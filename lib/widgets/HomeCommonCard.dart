/*
 * @Author: liubin
 * @Date: 2023-11-20 18:00:27
 * @LastEditTime: 2023-11-23 18:10:22
 * @LastEditors: liubin
 * @Description: 
 * @FilePath: \flutterDemo\hyt_app\lib\widgets\HomeCommonCard.dart
 */
import 'package:flutter/material.dart';
import 'package:hyt_app/common/HexColor.dart';

class HomeCommonCard extends StatelessWidget {
  const HomeCommonCard({
    super.key,
    required this.title, // 模块标题
    required this.isShowRightArrow, // 是否显示右侧箭头
    required this.child, // 子组件/模块内容
  });

  final String title; // 模块标题
  final bool isShowRightArrow; // 是否显示右侧箭头
  final Widget child; // 子组件/模块内容

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: HexColor('#EEEEEE')),
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: HexColor('#333333'),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: '苹方-简 中黑体'),
                      ),
                      isShowRightArrow
                          ? InkWell(
                              onTap: () {
                                print('点击全部');
                              },
                              child: Row(children: [
                                Text(
                                  '全部',
                                  style: TextStyle(
                                      color: HexColor('#AAAAAA'), fontSize: 13),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                  color: HexColor('#AAAAAA'),
                                )
                              ]),
                            )
                          : Container()
                    ]),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
