import 'package:flutter/material.dart';
import 'package:wechat/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //1, 0, 0, 0.0 设置为透明 0.0透明度 item长按
        highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
        //tabbar item点击
        splashColor: Color.fromRGBO(1, 0, 0, 0.0),
        cardColor: Color.fromRGBO(1, 1, 1, 0.5),
        primarySwatch: Colors.blue,
        //点击的水波纹去掉。tabbar
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootPage(),
    );
  }
}
