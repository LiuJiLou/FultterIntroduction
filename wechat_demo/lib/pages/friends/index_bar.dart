import 'package:flutter/material.dart';
import 'package:wechat/const.dart';

class IndexBar extends StatefulWidget {
  //创建索引条回调
  final void Function(String str) indexBarCallBack;

  IndexBar({this.indexBarCallBack});

  @override
  _IndexBarState createState() => _IndexBarState();
}

int getIdex(BuildContext context, Offset globalPosition) {
//  拿到box
  RenderBox box = context.findRenderObject();
//  拿到y值
  double y = box.globalToLocal(globalPosition).dy;
//  算出字符高度  box 的总高度 / 2 / 字符开头数组个数
  var itemHeight = ScreenHeight(context) / 2 / INDEX_WORDS.length;
  //算出第几个item，并且给一个取值范围   ~/ y除以item的高度取整  clamp 取值返回 0 -
  int index = (y ~/ itemHeight).clamp(0, INDEX_WORDS.length - 1);

  print('现在选中的是${INDEX_WORDS[index]}');
  return index;
}

class _IndexBarState extends State<IndexBar> {
  Color _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;
  double _indicatorY = 0.0; //悬浮窗位置
  String _indicatorText = 'A'; //显示的字母
  bool _indocatorHidden = true; //是否隐藏悬浮窗

  @override
  Widget build(BuildContext context) {
    List<Widget> words = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      words.add(Expanded(
          child: Text(
        INDEX_WORDS[i],
        style: TextStyle(fontSize: 10, color: _textColor),
      )));
    }

    return Positioned(
      right: 0.0,
      height: ScreenHeight(context) / 2,
      top: ScreenHeight(context) / 4,
      width: 120,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment(0, _indicatorY),
            width: 100,
            child: _indocatorHidden
                ? null
                : Stack(
                    alignment: Alignment(-0.2, 0), //0, 0 是中心顶部是0，-1  左边中心是-1，0
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/气泡.png'),
                        width: 60,
                      ),
                      Text(
                        _indicatorText,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ), //气泡
          ),
          GestureDetector(
            child: Container(
              width: 20,
              color: _bkColor,
              child: Column(
                children: words,
              ),
            ),
            onVerticalDragUpdate: (DragUpdateDetails details) {
              int index = getIdex(context, details.globalPosition);

              setState(() {
                _indicatorText = INDEX_WORDS[index];
                //根据我们索引条的Alignment的Y值进行运算的。从 -1.1 到 1.1
                //整个的Y包含的值是2.2
                _indicatorY = 2.2 / INDEX_WORDS.length * index - 1.1;
                _indocatorHidden = false;
              });
              widget.indexBarCallBack(INDEX_WORDS[index]);
            }, //按住屏幕移动手指实时更新触摸的位置坐标

            onVerticalDragDown: (DragDownDetails details) {
              //globalPosition 自身坐标系
              int index = getIdex(context, details.globalPosition);
              _indicatorText = INDEX_WORDS[index];
              _indicatorY = 2.2 / INDEX_WORDS.length * index - 1.1;
              _indocatorHidden = false;
              widget.indexBarCallBack(INDEX_WORDS[index]);
              print('现在点击的位置是${details.globalPosition}');
              setState(() {
                _bkColor = Color.fromRGBO(1, 1, 1, 0.5);
                _textColor = Colors.white;
              });
            }, //触摸开始

            onVerticalDragEnd: (DragEndDetails details) {
              setState(() {
                _indocatorHidden = true;
                _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
                _textColor = Colors.black;
              }); //触摸结束
            },
          ) //这个是索引条
        ],
      ),
    );
  }
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
