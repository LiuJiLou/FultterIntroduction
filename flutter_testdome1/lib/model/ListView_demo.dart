import 'package:flutter/material.dart';

import 'car.dart';

class ListViewDemo extends StatelessWidget {
  //  定义一个函数.这里不要写死，要不后面需要修改的话不好修改，
//  return一个容器 Container，将控件放进去
  Widget _itemForRow(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Image.network(datas[index].imageUrl),
//         margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          SizedBox(
            height: 10,
          ),
          Text(
            datas[index].name,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.0,
              fontStyle: FontStyle.values[1],
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datas.length, //相当于iOS中的cell个数
      itemBuilder: _itemForRow,
    );
  }
}

final List<Car> datas = [
  Car(
    name: '保时捷918 Spyder',
    imageUrl:
        'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  Car(
    name: '兰博基尼Aventador',
    imageUrl:
        'https://upload-images.jianshu.io/upload_images/2990730-e3bfd824f30afaac?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  Car(
    name: '法拉利Enzo',
    imageUrl:
        'https://upload-images.jianshu.io/upload_images/2990730-a1d64cf5da2d9d99?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  Car(
    name: 'Zenvo ST1',
    imageUrl:
        'https://upload-images.jianshu.io/upload_images/2990730-bf883b46690f93ce?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  Car(
    name: '迈凯伦F1',
    imageUrl:
        'https://upload-images.jianshu.io/upload_images/2990730-5a7b5550a19b8342?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  Car(
    name: '萨林S7',
    imageUrl:
        'https://upload-images.jianshu.io/upload_images/2990730-2e128d18144ad5b8?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  Car(
    name: '科尼赛克CCR',
    imageUrl:
        'https://upload-images.jianshu.io/upload_images/2990730-01ced8f6f95219ec?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  Car(
    name: '布加迪Chiron',
    imageUrl:
        'https://upload-images.jianshu.io/upload_images/2990730-7fc8359eb61adac0?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  Car(
    name: '轩尼诗Venom GT',
    imageUrl:
        'https://upload-images.jianshu.io/upload_images/2990730-d332bf510d61bbc2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  Car(
    name: '西贝尔Tuatara',
    imageUrl:
        'https://upload-images.jianshu.io/upload_images/2990730-3dd9a70b25ae6bc9?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  )
];
