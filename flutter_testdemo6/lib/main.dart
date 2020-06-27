import 'package:flutter/material.dart';

import 'key_demo2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //Widget 树 第一个Widget
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          //第二个widget
//          appBar: AppBar(), //第三个widget
          body: GlobalKeyDemo(),
//          KeyDemo(),
//          MyHomePage1(),
        ));
  }
}

// -------------------  StatelessWidget -------------------------
class MyHomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KeyDemo'),
      ),
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
