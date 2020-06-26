import 'package:flutter/material.dart';

//数据共享
//子部件随时都能拿到这里的数据
//这个就是一个单例对象，data是已经存在的
class MyData extends InheritedWidget {
//  ： 是重定向方法
  MyData({this.data, Widget child}) : super(child: child);
  final int data; //需要再子Widget 中共享的数据！

//  提供一个方法让子Widget 访问的共享数据！
  static MyData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyData>();
  }

  @override
  bool updateShouldNotify(MyData oldWidget) {
    return oldWidget.data != data;
  }
}

//*************************************************************
class InhertedDemo extends StatefulWidget {
  @override
  _InhertedDemoState createState() => _InhertedDemoState();
}

class _InhertedDemoState extends State<InhertedDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MyData(
      //这是根结点，所有下面子部件都依赖于MyData
//      在ziwidget里面都会有一个data。这个在当前根结点销毁的时候自动就销毁了
      data: count,
      child: Column(
        children: <Widget>[
          TestInherited1(),
          RaisedButton(
              child: Text('按钮'),
              onPressed: () => setState(() {
                    count++;
                  }))
        ],
      ),
    );

//    return Column(
//      children: <Widget>[
//        Test1(count),
//        RaisedButton(
//            child: Text('按钮'),
//            onPressed: () => setState(() {
//                  count++;
//                }))
//      ],
//    );
  }
}

//-------------------- 测试 层层传递数据 --------------------------
class Test1 extends StatelessWidget {
  final int count;
  Test1(this.count);
  @override
  Widget build(BuildContext context) {
    return Test2(count);
  }
}

class Test2 extends StatelessWidget {
  final int count;
  Test2(this.count);
  @override
  Widget build(BuildContext context) {
    return Test3(count);
  }
}

class Test3 extends StatefulWidget {
  final int count;
  Test3(this.count);
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.count.toString());
  }
}

//-------------------- 测试 Inherited 共享数据 --------------------------
class TestInherited1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestInherited2();
  }
}

class TestInherited2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestInherited3();
  }
}

class TestInherited3 extends StatefulWidget {
  @override
  _TestInherited3State createState() => _TestInherited3State();
}

class _TestInherited3State extends State<TestInherited3> {
//  MyData 中数据 data toString就是我们数据的字符串
  @override
  Widget build(BuildContext context) {
    return Text(MyData.of(context).data.toString());
  }

//  改变依赖关系
//  依赖发生变化之后，方法也会调用
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('didChangeDependencies');
    super.didChangeDependencies();
  }
}
