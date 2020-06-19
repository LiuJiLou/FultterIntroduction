import 'package:flutter/material.dart';

//widget 都是继承 StatelessWidget 或  StatefulWidget
//StatelessWidget 无状态 里面的数据是静态的，也就是创建出来之后是不能改变的
//StatelessWidget 只渲染一次，如下点击count 加了之后不会去调用build 去渲染页面
class StateManagerDemo extends StatelessWidget {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StateManagerDemo'),
        ),
        body: Center(
          child: Chip(label: Text('$count')),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            count += 1;
            print('count = $count');
          },
        ));
  }
}

// 有状态，这是一个树状结构，如果变化的话通知 StatefulWidget 将会从头到尾全部重新渲染
//所以不要什么都用 StatefulWidget
class StateManagerDemo2 extends StatefulWidget {
  @override
  _StateManagerDemo2State createState() => _StateManagerDemo2State();
}

//State 用来管理状态的
//State<StateManagerDemo2> 泛型用来关联 StateManagerDemo2
class _StateManagerDemo2State extends State<StateManagerDemo2> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StateManagerDemo'),
        ),
        body: Center(
          child: Chip(label: Text('$count')),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              //当发生变化的时候去重新build
              count += 1;
            });
            print('count = $count');
          },
        ));
  }
}
