import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChoosePicture extends StatefulWidget {
  @override
  _ChoosePictureState createState() => _ChoosePictureState();
}

class _ChoosePictureState extends State<ChoosePicture> {
//  与原生通讯的管道
//  channel 擦混一个唯一的标记字符串.类似于通知。原生代码中也通过通道唯一标识来获取这个channel
  MethodChannel _methodChannel = MethodChannel('choose_picture_page');

  File _avataFile;

//  监听原生代码的回调
  @override
  void initState() {
    // TODO: implement initState
    _methodChannel.setMethodCallHandler((call) {
      if (call.method == 'imagePath') {
        //转成字符串 toString 截取第7个字符之后的内容 前面的file://是无用的，需要去掉
        String imagePath = call.arguments.toString().substring(7);
        setState(() {
          print(imagePath);
          _avataFile = File(imagePath);
        });
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print('切换图片');
              _methodChannel.invokeMapMethod('picture');
            },
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.0), //设置圆角
                image: DecorationImage(
                  image: _avataFile == null
                      ? AssetImage('images/相机.png')
                      : FileImage(_avataFile),

//                fit: BoxFit.cover
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
