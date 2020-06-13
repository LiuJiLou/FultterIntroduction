//不需要自己写构造函数，系统会自动处理
//class Car {
//  String name;
//  String imageUrl;
//}

//如果变量后面不需要修改用fine 修饰，赋值之后就不可变。是运行时的，能节约一点性能
//需要些构造函数，可以直接 option + enter
//这样的话 main中就不能直接点 赋值了，需要调用Car函数传值.这叫同名构造函数
// 传值是更跟传过来的顺序有关系
class Car {
  final String name;
  final String imageUrl;

//  String name;
//  String imageUrl;

//  const 修饰是为了以后区分有状态无状态进行界面渲染的时候，全是常量的模型重新构建
//  如果全是final 修饰的不改变的变量的模型。不去重新构建提高性能
//  const 修饰的前提是，成员必须都是final 的时候
//  const Car(this.name, this.imageUrl);
//  Car(this.name, this.imageUrl);

//  用{}括住的是可选参数，没有括住的是必填参数
//  Car(this.name, {this.imageUrl});
  Car({this.name, this.imageUrl});

//  通过一个数组返回一个对象，这个时候就不能用final 了
//  这里name = list[0] 这个类似字典没事根据数据中的值，取出来赋值给对应的
//  Car.fromList(List<dynamic> list) {
//    name = list[0];
//    imageUrl = list[1];
//  }

//  调用的方法1
//  Car.defalut(String name,String url){
//    Car(name: name, imageUrl: url);
//  }
//  调用的方法2
//  : 代表重定向，也就是左边的参数传过来之后，直接调用右边的函数(注意函数名)
//  Car.defalut(String name, String url) : this.fromList([name,url]);
//  Car.defalut(String name, String url) : this(name: name, imageUrl: url);
}
