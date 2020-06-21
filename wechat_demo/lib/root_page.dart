import 'package:flutter/material.dart';
import 'package:wechat/pages/chat/chat_page.dart';
import 'package:wechat/pages/discover/discover_page.dart';
import 'package:wechat/pages/friends/friends.dart';
import 'package:wechat/pages/mine.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

List<Widget> _pages = [
  ChatPage(),
  FriendsPage(),
  DiscoverPage(),
  MinePage(),
];

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //页面滚动变化时调用
//        onPageChanged: (int index){
//          _currentIndex = index;
//          setState(() {});
//        },
        physics: NeverScrollableScrollPhysics(), //禁止页面滚动，tabbar页面
        controller: _controller,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _controller.jumpToPage(index);
        },
        //tabbar item字体大小
        selectedFontSize: 12.0,
        currentIndex: _currentIndex, //默认启动显示的item 从0开始
        fixedColor: Colors.green, //选中的颜色
        type: BottomNavigationBarType.fixed, //固定
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/tabbar_chat.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_chat_hl.png',
                width: 20,
                height: 20,
              ),
              title: Text('微信')),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/tabbar_friends.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_friends_hl.png',
                width: 20,
                height: 20,
              ),
              title: Text('通讯录')),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/tabbar_discover.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_discover_hl.png',
                width: 20,
                height: 20,
              ),
              title: Text('发现')),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/tabbar_mine.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_mine_hl.png',
                width: 20,
                height: 20,
              ),
              title: Text('我')),
        ],
      ),
    );
  }
}
