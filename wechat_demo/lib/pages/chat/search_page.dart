import 'dart:core';

import 'package:flutter/material.dart';
import 'package:wechat/pages/chat/search_bar.dart';

import 'chat_page.dart';

class SearchPage extends StatefulWidget {
  final List<Chat> datas;
  const SearchPage({this.datas});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Chat> _models = [];
  String _searchStr = '';
  TextStyle _normalStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  TextStyle _highlightStyle = TextStyle(
    fontSize: 16,
    color: Colors.green,
  );

  Widget _title(String name) {
    List<TextSpan> spans = [];
    List<String> strs = name.split(_searchStr);
    for (int i = 0; i < strs.length; i++) {
      String str = strs[i]; //拿出字符串
      if (str == '' && i < strs.length - 1) {
        spans.add(TextSpan(text: _searchStr, style: _highlightStyle));
      } else {
        spans.add(TextSpan(text: str, style: _normalStyle));
        if (i < strs.length - 1) {
          spans.add(TextSpan(text: _searchStr, style: _highlightStyle));
        }
      }
    }
    return RichText(
      text: TextSpan(children: spans),
    );
  }

  void _searchData(String text) {
    //每次进来都是重新搜索
    _models.clear();
    _searchStr = text;
    if (text.length > 0) {
      for (int i = 0; i < widget.datas.length; i++) {
        String name = widget.datas[i].name;
        if (name.contains(text)) {
          _models.add(widget.datas[i]);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SearchBar(
            onChanged: (text) {
              _searchData(text);
            },
          ),
          Expanded(
              flex: 1,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: _models.length, itemBuilder: _buildCellForRow),
              ))
        ],
      ),
    );
  }

  Widget _buildCellForRow(BuildContext context, int index) {
    return ListTile(
      title: _title(_models[index].name),
      subtitle: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(right: 10),
        height: 25,
        child: Text(
          _models[index].message,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            image:
                DecorationImage(image: NetworkImage(_models[index].imageUrl))),
      ), //聊天cell
    );
  }
}
