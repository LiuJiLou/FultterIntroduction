import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

//多线程
void main() {
//  test1();
//  test2();
//  test3();
//  test4();
//  test5();
  test6();
}

void func(int count) {
  print('1、搞定了！');
}

void func2(int count) {
  print('2、搞定了！');
}

//-------------------------多线程1---------------------
void test1() {
  print('外部代码1');
  Isolate.spawn(func, 10);
  sleep(Duration(seconds: 1));
  print('外部代码2');
}

//-------------------------多线程2---------------------
void test2() {
  print('外部代码1');
  Isolate.spawn(func, 10);
  Isolate.spawn(func2, 10);
  Isolate.spawn(func, 10);
  Isolate.spawn(func2, 10);
  Isolate.spawn(func, 10);
  Isolate.spawn(func2, 10);
  Isolate.spawn(func, 10);
  Isolate.spawn(func2, 10);
  Isolate.spawn(func, 10);
  Isolate.spawn(func2, 10);

  sleep(Duration(seconds: 1));
  print('外部代码2');
}

//-------------------------多线程3---------------------
int a = 10;
void test3() {
  print('外部代码1');
  Isolate.spawn(func3, 100);
  sleep(Duration(seconds: 1));
  print('休眠回来之后的a是$a');
  print('外部代码2');
}

void func3(int count) {
  a = count;
  print('3、搞定了！');
  print('a现在是$a');
}

//-------------------------多线程4---------------------
//多线程通讯
void test4() {
  print('外部代码1');

//  创建Port 端口
  ReceivePort port = ReceivePort();
  Isolate.spawn(func4, port.sendPort);
  port.listen((message) {
    a = message;
    print('端口回来的数据a是$a');
  });

  sleep(Duration(seconds: 1));
  print('休眠回来之后的a是$a');
  print('外部代码2');
}

void func4(SendPort send) {
  print('4、搞定了！');
  send.send(1000);
}

//-------------------------多线程5---------------------
//多线程 异步
void test5() async {
  print('外部代码1');

//  创建Port 端口
  ReceivePort port = ReceivePort();
//  创建Isolate
  Isolate iso = await Isolate.spawn(func5, port.sendPort);

  port.listen((message) {
    a = message;
    print('端口回来的数据a是$a');
    iso.kill(); //使用完毕之后释放
  });

  sleep(Duration(seconds: 1));
  print('休眠回来之后的a是$a');
  print('外部代码2');
}

void func5(SendPort send) {
  final port = ReceivePort();

  print('5、搞定了！');
  send.send(1000); //给主线程发送消息（数据）
}

//-------------------------多线程6---------------------
//多线程 compute 对 Isolate进行封装
void test6() async {
  print('外部代码1');

  int x = await compute(func6, 10);
  print(x);
//  或者
//  compute(func6, 10).then((value) => print(value));

  sleep(Duration(seconds: 1));
  print('外部代码2');
}

int func6(int count) {
  return 2000;
}
