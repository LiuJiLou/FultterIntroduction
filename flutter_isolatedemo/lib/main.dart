import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

void main() {
  tesIsolateDemo();
//  testThenDemo();
  testTimerDemo();
//  dioDemo();
}

// ******************************* 网络请求 ****************************
void dioDemo() {
//  1、创建dio 对象
  final dio = Dio();
//  2、下载数据
  final downloadUrl =
      'http://pub.idqqimg.com/pc/misc/groupgift/fudao/CourseTeacher_1.3.16.80_DailyBuild.dmg';
//  3、下载存储路径好保存的文件名，如果路径中有不存在的文件夹，会自动创建
  String savePath = '/Users/liujilou/Desktop/腾讯课堂.dmg';
//  获取沙盒路径
  String savePath2 = Directory.systemTemp.path + '/腾讯课堂.dmg';
  print(savePath2);

  download1(dio, downloadUrl, savePath);
}

void download2(Dio dio, String downloadUrl, String savePath) {
  dio.download(downloadUrl, (header) {
    return savePath;
  }, onReceiveProgress: showDownloadProgress);
}

void download1(Dio dio, String downloadUrl, String savePath) {
  dio
      .download(downloadUrl, savePath, onReceiveProgress: showDownloadProgress)
      .then((value) => print(value))
      .whenComplete(() => print('结束了'));
}

void showDownloadProgress(int count, int total) {
//  toStringAsFixed 取整不要小数
  if (total != -1) {
    print((count / total * 100).toStringAsFixed(0) + "%");
  }
}

void futurDemo() {
//  关于then， 它在Future任务执行完毕之后，立刻执行，可以看成一个任务执行（面试有问）
  Future x = Future(() {
    print('A异步任务1');
    scheduleMicrotask(() => print('B微任务1'));
  });
  x.then((value) => print('C异步1结束'));
  print('D主任务');

//  首先主任务先执行，然后再执行异步任务。异步任务执行的时候是先执行微任务，后执行其他任务
// 所以应该是先 D 后 A，A之后添加了一个微任务到任务队列中，
// 如果说then 是在异步任务1执行完再执行的话，那么肯定是先执行为微任务 C，再执行then D
// 实际上的执行顺序是 D  A C B 。可以分析指导，在Future 任务执行完毕，立刻执行了 then，可以看成是一个任务执行的
}

//******************************* 多线程 ********************************
void tesIsolateDemo() {
//  isolateDemo1();
//  isolateDemo2();
}

// -------------------------- 多线程1 --------------------------
void isolateDemo1() {
//  结果是无序的
  Future(() => compute(func1, 123)).then((value) => print('1结束'));
  Future(() => compute(func1, 123)).then((value) => print('2结束'));
  Future(() => compute(func1, 123)).then((value) => print('3结束'));
  Future(() => compute(func1, 123)).then((value) => print('4结束'));
  Future(() => compute(func1, 123)).then((value) => print('5结束'));
}

// -------------------------- 多线程2 --------------------------
void isolateDemo2() {
//  结果是有序的
  loadData().then((value) => print('1结束'));
  loadData().then((value) => print('2结束'));
  loadData().then((value) => print('3结束'));
  loadData().then((value) => print('4结束'));
  loadData().then((value) => print('5结束'));
}

Future loadData() {
  return Future(() {
    //如果你返回是compute 的Futura ，那么这个任务在子 Isolate 的事件队列中
//    print(Isolate.current.debugName);
    compute(func1, 123); //有序
//    return compute(func1, 123);//无序
  });
}

void func1(int count) {
  print(Isolate.current.debugName);
}

//******************************* 验证一下then 到底是微任务还是什么？ ********************************
void testThenDemo() {
//  关于then，它在Future任务执行完毕之后，立刻执行！可以看成一个任务执行
  Future x = Future(() {
    print('A异步任务1');
    scheduleMicrotask(() => print('B微任务'));
  });

  x.then((value) => print('C异步1结束'));
  print('D主任务');
}

//******************************* 验证一下then 到底是微任务还是什么？ ********************************
void testTimerDemo() {
  Timer.run(() {
    print('异步任务!');
  });
  print('来了');
}
