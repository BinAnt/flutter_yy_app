import 'package:flutter/material.dart';
import 'package:hyt_app/common/index.dart';

List<Map<String, dynamic>> list = [
  {'title': '门诊缴费', 'icon': 'images/icon_5.png', 'sort': 4},
  {'title': '自助开单', 'icon': 'images/icon_6.png', 'sort': 5},
  {'title': '检查预约', 'icon': 'images/icon_7.png', 'sort': 6},
  {'title': '线上极速问诊', 'icon': 'images/icon_8.png', 'sort': 7},
  {'title': '导诊单', 'icon': 'images/icon_9.png', 'sort': 8},
  {'title': '报告查询', 'icon': 'images/icon_10.png', 'sort': 9},
  {'title': '多学科会诊', 'icon': 'images/icon_11.png', 'sort': 10},
  {'title': '药品咨询', 'icon': 'images/icon_12.png', 'sort': 11},
  {'title': '护理咨询', 'icon': 'images/icon_13.png', 'sort': 12},
  {'title': '取号缴费', 'icon': 'images/icon_14.png', 'sort': 13},
  {'title': '随访门诊', 'icon': 'images/icon_15.png', 'sort': 14},
  {'title': '取药查询', 'icon': 'images/icon_16.png', 'sort': 15},
  {'title': '候诊查询', 'icon': 'images/icon_17.png', 'sort': 16},
  {'title': '门诊药学服务', 'icon': 'images/icon_18.png', 'sort': 17},
];

/// 门诊服务组件
class OutpatientService extends StatelessWidget {
  const OutpatientService({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 11,
          children: list.map((item) {
            var i = item['sort'];
            return SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: InkWell(
                onTap: () {
                  // 方法一
                  showToast(context, '点击${item['title']}');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.12,
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: Image.asset('images/icon_${(i + 1)}.png',
                          width: 20, height: 20),
                    ),
                    Container(
                      width: 60,
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Text(
                        item['title'], 
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        ),),
                    )
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}
