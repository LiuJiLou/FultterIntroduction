import 'dart:async';
import 'dart:io';

String _data = '0';

void main() {
  testGetData();
//  testGetData1();
}

void testGetData() {
  //  getData();
//  getData1();
//  getData2();
  getData3();
//  getData4();
//  getData5();
//  getData6();

//  休眠1秒
//  sleep(Duration(seconds: 1));
  print('其他操作');
}

//------------------------------同步------------------------------------
void getData() {
  print('开始data=$_data');

  for (int i = 0; i < 100000; i++) {
    _data = '网络请求';
  }

  print('结束data=$_data');
}

//------------------------------异步1------------------------------------
void getData1() {
  print('开始data=$_data');
//  异步
  Future(() {
    for (int i = 0; i < 100000; i++) {
      _data = '网络请求';
    }

    print('结束data=$_data');
  });
}

//-------------------------------异步2-----------------------------------
void getData2() {
  print('开始data=$_data');

  Future(() {
    for (int i = 0; i < 100000; i++) {
      _data = '网络请求';
    }
  });

  print('结束data=$_data');
}

//-------------------------------异步3-----------------------------------
Future<void> getData3() async {
  print('开始data=$_data');

//  1、await 后面的操作必须是异步才能用
//  2、当前函数必须是异步函数
  await Future(() {
    for (int i = 0; i < 100000; i++) {
      _data = '网络请求';
    }
  });

  print('结束data=$_data');
  print('再做其他执行操作');
}

//-------------------------------异步4-----------------------------------
Future<void> getData4() async {
  print('开始data=$_data');

  Future future = Future(() {
    for (int i = 0; i < 100000; i++) {
      _data = '网络请求';
      return '网络请求12345';
    }
  });

//  使用then 来接收数据
//  then 是在future 异步指向完毕只有才会去调用执行的
  future.then((value) => print(value));

  print('结束data=$_data');
  print('再做其他执行操作');
}

//-------------------------------异步5-----------------------------------
Future<void> getData5() async {
  print('开始data=$_data');

  Future future = Future(() {
    for (int i = 0; i < 100000; i++) {
      throw Exception('网络异常');
      return '网络请求12345';
    }
  });

  future.catchError((e) {
    print('捕获到了：' + e.toString());
  });
//  使用then 来接收数据
//  then 是在future 异步指向完毕只有才会去调用执行的
  future.then((value) {
    print('then 执行了');
  });

  print('再做其他执行操作');
}

//-------------------------------异步6-----------------------------------
Future<void> getData6() async {
  print('开始data=$_data');

  Future future = Future(() {
    for (int i = 0; i < 100000; i++) {
      throw Exception('网络异常');
    }
  });

//  future.catchError((e) {
//    print('捕获到了：' + e.toString());
//  }).then((value) {
//    print('the 执行了');
//  });

//  或
//    Future<R> then<R>(FutureOr<R> onValue(T value), {Function onError});
//  onError 是then 中的一个可选参数，这样就不用catchError了
  future.then((value) {
    print('the 执行了');
  }, onError: (e) {
    print(e.toString());
  });

  print('再做其他执行操作');
}

//-------------------------------异步7-----------------------------------
Future<void> getData7() async {
  print('开始data=$_data');

  Future(() {
    for (int i = 0; i < 100000; i++) {
      throw Exception('网络异常');
    }
  }).then((value) {
    print('the 执行了');
  }).catchError((e) {
    print('捕获到了：' + e.toString());
  }).whenComplete(() {
    print('完成了');
  });

  print('再做其他执行操作');
}

//**************************** 多个异步 ******************************
void testGetData1() {
//  testFuture1();
//  testFuture2();
//  testFuture3();
//  testFuture4();
//  testFuture5();
//  testFuture6();
//  testFuture7();
//  testFuture8();
  testFuture9();
}

//-------------------------------多个异步1------------------------------
void testFuture1() {
  Future(() {
//    sleep(Duration(seconds: 1));
    return '任务1';
  }).then((value) => print('$value结束'));
  Future(() {
    return '任务2';
  }).then((value) => print('$value结束'));
  Future(() {
    return '任务3';
  }).then((value) => print('$value结束'));
  Future(() {
    return '任务4';
  }).then((value) => print('$value结束'));

  print('任务添加完毕');
}

//-------------------------------多个异步2------------------------------
void testFuture2() {
  Future(() {
//    sleep(Duration(seconds: 1));
    return '任务1';
  }).then((value) {
    print('$value结束');
    return '任务4';
  }).then((value) {
    print('$value结束');
  });

  Future(() {
    return '任务2';
  }).then((value) => print('$value结束'));
  Future(() {
    return '任务3';
  }).then((value) => print('$value结束'));

  print('任务添加完毕');
}

//-------------------------------多个异步3------------------------------
void testFuture3() {
  Future(() {
    return '任务1';
  }).then((value) {
    print('$value结束');
    return '任务4';
  }).then((value) {
    print('$value结束');
    return '任务2';
  }).then((value) {
    print('$value结束');
    return '任务3';
  }).then((value) {
    print('$value结束');
  });

  print('任务添加完毕');
}

//-------------------------------多个异步4------------------------------
void testFuture4() {
  Future(() {
//    return '任务1';
    throw Exception('任务1异常');
  })
//  .catchError((e){ //放在这里，任务1异常。后面的任务4、2、3还能正常执行
//    print(e.toString());
//  })
      .then((value) {
    print('$value结束');
    return '任务4';
  }).then((value) {
    print('$value结束');
    return '任务2';
  }).then((value) {
    print('$value结束');
    return '任务3';
  }).then((value) {
    print('$value结束');
  }).catchError((e) {
    //放在这里，任务1异常。后面的任务4、2、3将不再执行
    print(e.toString());
  });

  print('任务添加完毕');
}

//-------------------------------多个异步5------------------------------
//假如有两个异步，想在两个异步都执行完之后再去做其他操作
void testFuture5() {
  Future.wait([
    Future(() {
      return '任务1';
    }),
    Future(() {
      sleep(Duration(seconds: 1));
      return '任务2';
    })
  ]).then((value) => print(value[0] + value[1]));

  print('任务添加完毕');
}

//-------------------------------多个异步6------------------------------
//假如有两个异步，想在两个异步都执行完之后再去做其他操作
void testFuture6() {
  print('外部代码1');
  Future(() => print('A')).then((value) => print('A结束'));
  Future(() => print('B')).then((value) => print('B结束'));

  scheduleMicrotask(() {
    print('微任务A');
  });
  sleep(Duration(seconds: 1));

  print('外部代码2');
}

//-------------------------------多个异步7------------------------------
//假如有两个异步，想在两个异步都执行完之后再去做其他操作
void testFuture7() {
  Future x = Future(() => null);
  Future x1 = Future(() => print('1'));
  Future(() => print('2'));
  scheduleMicrotask(() => print('3'));
  x1.then((value) => print('4'));
  print('5');
  x.then((value) => print('6'));

//  执行顺序如下
//  同步先执行
//  print('5');
//  然后是微任务添加到队列
//  scheduleMicrotask(() => print('3'));
//  然后异步任务按顺序添加，并紧接着执行异步的then
//  Future x = Future(() => null);
//  x.then((value) => print('6'));
//  Future x1 = Future(() => print('1'));
//  x1.then((value) => print('4'));
//  Future(() => print('2'));
}

//-------------------------------多个异步8------------------------------
//假如有两个异步，想在两个异步都执行完之后再去做其他操作
void testFuture8() {
  Future x = Future(() => null);
  x.then((value) {
    print('6');
    scheduleMicrotask(() => print('7'));
  }).then((value) => print('8'));
  Future x1 = Future(() => print('1'));
  Future(() => print('2'));
  scheduleMicrotask(() => print('3'));
  x1.then((value) => print('4'));
  print('5');

//  执行顺序如下
//  同步先执行
//  print('5');
//  然后是微任务添加到队列
//  scheduleMicrotask(() => print('3'));
//  然后异步任务按顺序添加，并紧接着执行异步的then
//  Future x = Future(() => null);
//  x.then((value) print('6')
//  然后微任务加入队列，这里是加入，还不是执行，下一轮才是执行
//  scheduleMicrotask(() => print('7'));
//  然后执行 x 的 .then((value) => print('8'));
//这个时候进入到下一轮循环，先判断是否有微任务，然后执行微任务
//  print('7');
//  Future x1 = Future(() => print('1'));
//  x1.then((value) => print('4'));
//  Future(() => print('2'));
}

//-------------------------------多个异步9------------------------------
//假如有两个异步，想在两个异步都执行完之后再去做其他操作
void testFuture9() {
  Future x = Future(() => null);
  x.then((value) {
    print('6');
    scheduleMicrotask(() => print('7'));
  }).then((value) => print('8'));
  Future x1 = Future(() => print('1'));
  x1.then((value) {
    print('4');
    Future(() => print('9'));
  }).then((value) => print('10'));
  Future(() => print('2'));
  scheduleMicrotask(() => print('3'));

  print('5');

//  执行顺序如下
//  同步先执行
//  print('5');
//  然后是微任务添加到队列
//  scheduleMicrotask(() => print('3'));
//  然后异步任务按顺序添加，并紧接着执行异步的then
//  Future x = Future(() => null);
//  x.then((value) print('6')
//  然后微任务加入队列，这里是加入，还不是执行，下一轮才是执行
//  scheduleMicrotask(() => print('7'));
//  然后执行 x 的 .then((value) => print('8'));
//这个时候进入到下一轮循环，先判断是否有微任务，然后执行微任务
//  print('7');
//  Future x1 = Future(() => print('1'));
//  x1.then((value){ print('4')
//  然后创建异步任务加入队列，但是现在并不执行
//  Future(() => print('9'));
//  然后是x1 的 .then((value) => print('10'));
//  Future(() => print('2'));
//  最后才会一轮循环才会执行  print('9');
}
