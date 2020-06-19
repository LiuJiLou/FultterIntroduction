import 'package:flutter/material.dart';
import 'package:wechat/pages/discover/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<DiscoverPage> {
  Color _themeColor = Color.fromRGBO(220, 220, 220, 1.0);
  double _left_distance = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeColor,
        centerTitle: true, //安卓需要
        title: Text('发现'),
        elevation: 0.0, //底部边栏
      ),
      body: Container(
        color: _themeColor,
        height: 800,
        child: ListView(
          children: <Widget>[
            DiscoverCell(
              imageName: 'images/朋友圈.png',
              title: '朋友圈',
            ),
            SizedBox(
              //加一个横向的分割条，设置一个高度
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/扫一扫.png',
              title: '扫一扫',
            ),
            Row(
              children: <Widget>[
                Container(
                  width: _left_distance,
                  height: 0.5,
                  color: Colors.white,
                ),
                Container(
                  height: 0.5,
                )
              ],
            ),
            DiscoverCell(
              imageName: 'images/摇一摇.png',
              title: '摇一摇',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/看一看icon.png',
              title: '看一看',
            ),
            Row(
              children: <Widget>[
                Container(
                  width: _left_distance,
                  height: 0.5,
                  color: Colors.white,
                ),
                Container(
                  height: 0.5,
                )
              ],
            ),
            DiscoverCell(
              imageName: 'images/搜一搜.png',
              title: '搜一搜',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/附近的人icon.png',
              title: '附近的人',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/购物.png',
              title: '购物',
              subImageName: 'images/badge.png',
              subTitle: '618限时特价',
            ),
            Row(
              children: <Widget>[
                Container(
                  width: _left_distance,
                  height: 0.5,
                  color: Colors.white,
                ),
                Container(
                  height: 0.5,
                )
              ],
            ),
            DiscoverCell(
              imageName: 'images/游戏.png',
              title: '游戏',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/小程序.png',
              title: '小程序',
            ),
          ],
        ),
      ),
    );
  }
}
