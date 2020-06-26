import 'package:flutter/material.dart';
import 'package:fluttertestdemo5/inherited_demo.dart';

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
            appBar: AppBar(), //第三个widget
            body: InhertedDemo()
//          MyHomePage2(title: 'Stateful'),
//          MyHomePage1(title: 'hello'), //第四个widget
            ));
  }
}

// --------------------1、StatelessWidget 生命周期-------------------------
class MyHomePage1 extends StatelessWidget {
  final String title;
  MyHomePage1({this.title}) {
    print('1、构造函数被调用了！');
  }
  @override
  Widget build(BuildContext context) {
    print('1、bulid方法被调用');
    return Container();
  }
}

// --------------------2、StatelessWidget 生命周期-------------------------
//widget
class MyHomePage2 extends StatefulWidget {
  final String title;
  MyHomePage2({this.title}) {
    print('2、构造函数被调用了！');
  }

  @override
//  _MyHomePage2State() State 构造方法
  _MyHomePage2State createState() => _MyHomePage2State();
}

//State 状态管理
class _MyHomePage2State extends State<MyHomePage2> {
  int _count = 0;

  _MyHomePage2State() {
    print('State构造方法');
  }

  @override
  void initState() {
    print('State的init方法');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State的bulid方法');
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Icon(Icons.add),
          onPressed: () {
            _count++;
            setState(() {});
          },
        ),
        Text('$_count'),
      ],
    );
  }

//  当State 对象从渲染树中移除的时候就会调用
//  即将销毁，但是还没有销毁，可以坐其他一些操作，例如重新超如一个树中
  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    print('Statede的销毁方法');
    super.dispose();
  }
}
