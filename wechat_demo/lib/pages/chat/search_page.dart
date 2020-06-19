import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
