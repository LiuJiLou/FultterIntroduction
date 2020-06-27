import 'package:flutter/material.dart';

class GlobalKeyDemo extends StatelessWidget {
  final GlobalKey<_ChildPageState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GlobalKeyDemo'),
      ),
      body: ChildPage(
        key: _globalKey,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _globalKey.currentState.count++;
          _globalKey.currentState.data =
              'old' + _globalKey.currentState.count.toString();
//          局部渲染和跟新
          _globalKey.currentState.setState(() {});
        },
      ),
    );
  }
}

class ChildPage extends StatefulWidget {
  ChildPage({Key key}) : super(key: key);

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  int count = 0;
  String data = 'hello';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[Text(count.toString()), Text(data)],
      ),
    );
  }
}
