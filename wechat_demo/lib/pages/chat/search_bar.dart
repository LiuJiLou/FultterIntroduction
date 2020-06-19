import 'package:flutter/material.dart';
import 'package:wechat/const.dart';
import 'package:wechat/pages/chat/search_page.dart';

import 'chat_page.dart';

class SearchCell extends StatelessWidget {
  final List<Chat> datas;
  const SearchCell({this.datas});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (d) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SearchPage(
            datas: datas,
          );
        }));
      },
      child: Container(
        height: 44,
        color: WeChatThemColor,
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
            ),
          ), //白色底
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('images/放大镜.png'),
                width: 15,
                color: Colors.grey,
              ),
              Text(
                '搜索',
                style: TextStyle(fontSize: 15, color: Colors.black),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const SearchBar({this.onChanged});
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool _showClear = false;
  _onChange(String text) {
    if (text.length > 0) {
      widget.onChanged(text);
      setState(() {
        _showClear = true;
      });
    } else {
      widget.onChanged('');
      _showClear = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      color: WeChatThemColor,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            height: 44,
            color: Colors.red,
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenWidth(context) - 40,
                  height: 34,
                  margin: EdgeInsets.only(left: 5),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/放大镜b.png'),
                        width: 20,
                        color: Colors.grey,
                      ),
                      Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _controller,
                            onChanged: _onChange,
                            autofocus: true,
                            cursorColor: Colors.green,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 5, bottom: 10),
                                border: InputBorder.none,
                                hintText: '搜索'),
                          )),
                      _showClear
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  _controller.clear();
                                  _onChange('');
                                });
                              },
                              child: Icon(
                                Icons.clear,
                                size: 20,
                                color: Colors.grey,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ), //左边的圆角背景
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消'),
                )
              ],
            ),
          ) //下面的搜索条
        ],
      ),
    );
  }
}
