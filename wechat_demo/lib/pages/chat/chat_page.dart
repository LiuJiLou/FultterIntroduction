import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wechat/const.dart';
import 'package:wechat/pages/chat/search_bar.dart';
import 'package:wechat/tools/http_manager.dart' as http;

class ChatPage extends StatefulWidget {
  //as 是为了解决方法名冲突的问题！通过重命名 .方法名  调用
//  import 'package:wechat/tools/http_manager.dart' as http;
  @override
  _ChatPageState createState() => _ChatPageState();
}

//部件 保持状态
class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
  Widget _buildPopupMenuItem(String imageAss, String title) {
    return Row(
      children: <Widget>[
        Image(
          image: AssetImage(imageAss),
          width: 20,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

//  bool _cancleConnect = false;
  Timer _timer;
  //  CancelToken _token = CancelToken();

  List<Chat> _datas = [];

  @override
  void initState() {
    super.initState();
    print('Chat的init来了！');

//    开启一个定时器，这个地方是为了验证定时器Timer
    int _count = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _count++;
      print(_count);
      if (_count == 99) {
        timer.cancel(); //销毁定时器
      }
    });

    getDatas().then((List<Chat> datas) {
      print('数据来了');
//          if (!_cancleConnect) {
      print('更新数据');
      setState(() {
        _datas = datas;
      });
//          }
    }).catchError((e) {
      print('错误$e');
    }).whenComplete(() {
      print('完毕');
//        })
//        .timeout(Duration(seconds: 6))
//        .catchError((timeout) {
//          _cancleConnect = true;
//          print('超时输出:$timeout');
    });
  }

  //  网络请求耗时，定义方法的时候定义成异步的
  Future<List<Chat>> getDatas() async {
    //不在是取消连接了！
//    _cancleConnect = false;
    final response = await http.get(
        'http://rap2.taobao.org:38080/app/mock/256914/api/chat/list',
        timeout: 100);
    if (response.statusCode == 200) {
//      //获取相应数据，并转成Map类型！
//      final responseBody = json.decode(response.body);
//      转模型数组 map中遍历的结果需要返回处理啊
//    http请求解析
//      List<Chat> chatList = responseBody['chat_list'].map<Chat>((item) {
      List<Chat> chatList = response.data['chat_list'].map<Chat>((item) {
        return Chat.fromJson(item);
      }).toList();
      return chatList;
    } else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('微信'),
          backgroundColor: WeChatThemColor,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: PopupMenuButton(
                offset: Offset(0, 60.0),
                child: Image(
                  image: AssetImage('images/圆加.png'),
                  width: 25,
                ),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<String>>[
                    PopupMenuItem(
                        child: _buildPopupMenuItem('images/发起群聊.png', '发起群聊')),
                    PopupMenuItem(
                        child: _buildPopupMenuItem('images/添加朋友.png', '添加朋友')),
                    PopupMenuItem(
                        child: _buildPopupMenuItem('images/扫一扫.png', '扫一扫')),
                    PopupMenuItem(
                        child: _buildPopupMenuItem('images/收付款.png', '收付款')),
                  ];
                },
              ),
            ) //右上角按钮
          ],
        ),
        body: Container(
          child: _datas.length == 0
              ? Center(
                  child: Text('Loading...'),
                )
              : ListView.builder(
                  itemCount: _datas.length + 1,
                  itemBuilder: _buildCellForRow,
                ),
        ));
  }

  Widget _buildCellForRow(BuildContext context, int index) {
    if (index == 0) {
      return SearchCell(
        datas: _datas,
      );
    }
//    因为第一个位置放了搜索框，所以index要 -1，才能得到正确的数组数据下标
    index--;

    print('text name = ' + _datas[index].name);
    print('images url = ' + _datas[index].imageUrl);

    return ListTile(
      title: Text(_datas[index].name),
      subtitle: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(right: 10),
        height: 25,
        child: Text(
          _datas[index].message,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            image:
                DecorationImage(image: NetworkImage(_datas[index].imageUrl))),
      ),
    );
  }

//  类似ios 中的dealloc
  @override
  void dispose() {
    // TODO: implement dispose
//      取消我们的timer
    print('走了');
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }

    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class Chat {
  final String name;
  final String message;
  final String imageUrl;

  //直接赋值创建对象，必须创建新对象
  const Chat({this.name, this.message, this.imageUrl});

  //工厂构造函数
  //factory 可以创建已有的对象
  factory Chat.fromJson(Map json) {
    return Chat(
      name: json['name'],
      message: json['message'],
      imageUrl: json['imageUrl'],
    );
  }
}

//关于Map和Json
/*
*
//    final chat = {
//      'name': '张三',
//      'message': '吃了吗?',
//    };
    //Map转Json
//    final chatJson = json.encode(chat);
//    print(chatJson);

    //Json转Map
//    final newChat = json.decode(chatJson);
//    print(newChat['name']);
//    print(newChat['message']);
//    print(newChat is Map);
* */
