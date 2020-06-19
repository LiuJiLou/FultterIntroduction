import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat/pages/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<MinePage> {
  double _left_distance = 50;

  Widget headerWidget() {
    return Container(
      color: Colors.white,
      height: 205,
      child: Container(
//        color: Colors.yellow,
        margin: EdgeInsets.only(top: 100, bottom: 20),
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.only(left: 10),
//          padding: EdgeInsets.all(5),
//          color: Colors.red,
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                //图片通过装饰器去设置圆角是不起作用的，应该设置在装饰器内的背景图
//                child: Image(image:AssetImage('images/Hank.png')),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0), //设置圆角，image没有这个属性
                  //fit 填充
                  image: DecorationImage(
                      image: AssetImage('images/新的朋友.png'), fit: BoxFit.cover),
                ),
              ), //头像
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
                width: MediaQuery.of(context).size.width - 95,
//                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Liujilou',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ), //昵称
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '微信号:1234',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Image(
                          image: AssetImage('images/icon_right.png'),
                          width: 15,
                        )
                      ],
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  } //头部抽出来写个方法

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(220, 220, 220, 1),
            child: MediaQuery.removePadding(
                removeTop: true, //移除屏幕顶部刘海
                context: context,
                child: ListView(
                  children: <Widget>[
                    headerWidget(), //头部
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(
                      imageName: 'images/微信 支付.png',
                      title: '支付',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(
                      imageName: 'images/微信收藏.png',
                      title: '收藏',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: _left_distance,
                          color: Colors.white,
                          height: 0.5,
                        ),
                        Container(
                          height: 0.5,
                        )
                      ],
                    ),
                    DiscoverCell(
                      imageName: 'images/微信相册.png',
                      title: '相册',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: _left_distance,
                          color: Colors.white,
                          height: 0.5,
                        ),
                        Container(
                          height: 0.5,
                        )
                      ],
                    ),
                    DiscoverCell(
                      imageName: 'images/微信卡包.png',
                      title: '卡包',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: _left_distance,
                          color: Colors.white,
                          height: 0.5,
                        ),
                        Container(
                          height: 0.5,
                        )
                      ],
                    ),
                    DiscoverCell(
                      imageName: 'images/微信表情.png',
                      title: '表情',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(
                      imageName: 'images/微信设置.png',
                      title: '设置',
                    ),
                  ],
                )),
          ), //列表
          Container(
            height: 25,
            color: Color.fromRGBO(0, 0, 0, 0),
            margin: EdgeInsets.only(top: 40, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Image(image: AssetImage('images/相机.png'))],
            ),
          ), //相机
        ],
      ),
    );
  }
}
