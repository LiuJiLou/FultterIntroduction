import 'dart:math';

import 'package:flutter/material.dart';

class KeyDemo extends StatefulWidget {
  @override
  _KeyDemoState createState() => _KeyDemoState();
}

class _KeyDemoState extends State<KeyDemo> {
  List<Widget> items = [
//    StlItem1('aaa'),
//    StlItem1('bbb'),
//    StlItem1('ccc'),
//    -------------------------------
//    StfulItem2('aaa'),
//    StfulItem2('bbb'),
//    StfulItem2('ccc'),
    //    -------------key------------------
    StfulItem2('aaa', key: ValueKey('111')),
    StfulItem2('bbb', key: ValueKey('222')),
    StfulItem2('ccc', key: ValueKey('333')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KeyDemo'),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: items),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            items.removeAt(0);
          });
        },
      ),
    );
  }
}

//做一个正方形；
// ------------------ StatelessWidget  没问题 ----------------------------
class StlItem1 extends StatelessWidget {
  final title;
  StlItem1(this.title);
//  随机颜色 Random().nextInt(256) 随机正整数 0-255
  final _color = Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: _color,
      child: Text(title),
    );
  }
}

// ---------------------- StatefulWidget ----------------------------
class StfulItem2 extends StatefulWidget {
  final title;
//  StfulItem2(this.title);
  StfulItem2(this.title, {Key key}) : super(key: key);

  @override
  _StfulItem2State createState() => _StfulItem2State();
}

class _StfulItem2State extends State<StfulItem2> {
  //  随机颜色 Random().nextInt(256) 随机正整数 0-255
//  如果颜色也写到Widget中就不会出现，删除的时候颜色和文字不对的问题
  final _color = Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: _color,
      child: Text(widget.title),
    );
  }
}
