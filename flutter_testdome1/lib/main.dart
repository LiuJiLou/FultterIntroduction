import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/layout_demo.dart';

//void main() {
//  //  1、属性不加fina
//  Car ca1 = Car();
//  ca1.name = 'liujilou';
//  ca1.imageUrl = 'url';
//
////2、属性加fina 用如下构造函数
// Car(this.name, this.imageUrl);
//  Car ca1 = Car('liujilou', 'url');

//  3、用{}括住的是可选参数，没有括住的是必填参数
//  可选参数的传值，需要用属性名。不需要传值的时候，可以不传
//  const Car(this.name, {this.imageUrl});
//  Car ca1 = Car('liujilou',imageUrl: 'url');
//  Car ca1 = Car('liujilou', 'url');
//  Car ca1 = Car(name: 'liujilou', imageUrl: 'url');

////  Car.fromList(['liujilou','url']);
//  Car ca1 = Car.defalut('liujilou', 'url');
//
//  print('\nname:' + ca1.name + 'imageUrl:' + ca1.imageUrl);
//}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(
          primaryColor: Colors.blue,
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Flutte Demo'),
      ),
      body: LayoutDemo(), //布局
//      ContainerDemo(), //部件大小，对应坐标系
//          RichTextDemo(), //富文本
//          TextDemo(), //文本显示
//        ListViewDemo(),//ListView
    );
  }
}
