import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
//        alignment: Alignment(-1, -1),
        child: AspectDemo()
//        StackDemo()

//      child:
////      Center(
////        child:
//          Text('Layout_demo'),
////      ),
        );
  }
}

class AspectDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 100,
//      height: 100,
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(-1, -1),
      children: <Widget>[
        Positioned(
//          right: 0,
          child: Container(
            color: Colors.red,
            width: 200,
            height: 200,
            child: Icon(Icons.add),
          ),
        ),
        Positioned(
            right: 0,
            top: 10,
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
              child: Icon(Icons.search),
            )),
        Positioned(
            left: 0,
            top: 10,
            bottom: 10,
            child: Container(
              color: Colors.green,
              width: 50,
              height: 50,
              child: Icon(Icons.assessment),
            )),
      ],
    );
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
//        alphabetic  //英文字符
//        ideographic //中文字符
      children: <Widget>[
        Expanded(
            child: Container(
          height: 80,
          color: Colors.red,
          child: Text('test1', style: TextStyle(fontSize: 16)),
        )),

        Expanded(
            child: Container(
          height: 80,
          color: Colors.blue,
          child: Text('test1', style: TextStyle(fontSize: 26)),
        )),
        Expanded(
            child: Container(
          height: 80,
          color: Colors.green,
          child: Text('test1', style: TextStyle(fontSize: 36)),
        )),

//          Container(
//            color: Colors.red,
//            child: Icon(Icons.add, size: 30),
//          ),
//          Container(
//            color: Colors.blue,
//            child: Icon(Icons.ac_unit, size: 60),
//          ),
//          Container(
//            color: Colors.green,
//            child: Icon(Icons.access_alarms, size: 120),
//          )
      ],
    );
  }
}
