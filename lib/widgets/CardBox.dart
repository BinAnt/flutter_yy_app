import 'package:flutter/material.dart';

// 患者就诊卡
class CardBox extends StatelessWidget {
  const CardBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/cardbg.png'),
              )),
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*2*/
                    Expanded(child: Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          const Text(
                            '张萌萌（本人）',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(8.5)),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromRGBO(250, 179, 25, 1))),
                              child: const Text(
                                '已实名',
                                style: TextStyle(
                                    color: Color.fromRGBO(250, 179, 25, 1),
                                    fontSize: 11),
                              ))
                        ],
                      ),
                    )),
                    const Text(
                      '电子健康卡',
                      style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontSize: 12
                      ),
                    ),
                    const Text(
                      '1234****4321',
                      style: TextStyle(
                        color: Color.fromRGBO(3, 8, 26, 1),
                        fontSize: 15
                      ),
                    ),
                  ],
                ),
              ),
              /*3*/
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset('images/cardcode.png', width: 40, height: 40),
                Container(
                  padding: const EdgeInsets.only(top: 4),
                  child: const Text('点击刷卡', style: TextStyle(
                  color: Color.fromRGBO(141,156, 89, 1),
                  fontSize: 10,
                ),),
                )
              ],),
            ],
          ),
        ),
      ),
    );
  }
}