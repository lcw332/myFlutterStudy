/*
  dart语言支持以下数据类型
  数字
  字符串
  布尔
  列表（类似Java数组）
  集合
  映射?? 
  符文??(用于表示字符串中Unicode字符)
  符号??
 */
import 'dart:ffi';

class numType{
  void numTypeOne(){
    var x = 123;
    var hex = 0xDEAD8EFE;
  }
  void numTypeTwo(){
    var y = 1.999;
    var exponents = 1.42e5;

    //从Dart 2.1开始，必要时整数文字会自动转换为双精度数：
    double z = 10;
  }
}

class numCovertMethods{
  void stringToInt(){
    var one = int.parse('1');
    assert(one == 1); // 断言
  }
  void stringToDobule(){
    var onePointOne = double.parse('1.1');
    assert(onePointOne == 1.1);
  }
  void intToString(){
    var oneAsString = 1.toString();
    assert(oneAsString == '1'); 
  }
  void doubleToString(){
    String piaAsString  = 3.1415926.toStringAsFixed(2); // 保留小数点后两位
    assert(piaAsString == '3.14');
    print(piaAsString);
  }
}


class boolDemo{
  // 检查是否为空字符串
  void checkIsNullString(){
    var emptyStr = "";
    assert(emptyStr.isEmpty);
  }
  // 检查是否小于0
  void checkIsLessZero(){
    var numStr = 0;
    assert(numStr <= 0);
  }
  // 检查是否为null
  void checkIsNull(){
    var nullStr;
    assert(nullStr == null);
  }
  // 检查是否为NaN
  void checkIsNan(){
    var value = 0 / 0;
    assert(value.isNaN);
  }
}


/**
 * 1.可以直接打印list包括list的元素，list也是一个对象。但是java必须遍历才能打印list，java若直接打印list，结果是地址值。
 * 2.和java一样list里面的元素必须保持类型一致，不一致就会报错。
 * 3.和java一样list的角标从0开始。
 */
class listDemo{
  List ll = [10,2];

  //int 类型的list
  void intList(){
    List list = [10,7.23];
    print(list);
  }
  //编译时变量const的list
  void constList(){
    List constList = const[10,3,15];
    print(constList);
  }
  // list api 新增，把数字1添加到list中，默认是添加到末尾
  void listApiAdd(){
    ll.add(1);
    print(ll);
  }
  // list api 移除 移除int类型值 1
  void listApiRemove(){
    ll.remove(1);
    print(ll);
  } 
  // list api 插入 在索引0的地方插入数字5
  void listApiInsert(){
    ll.insert(0, 5);
    print(ll);
  }
  // list api 查找某个索引的值  查找10在list中的索引
  void listApiIndexOf(){
    ll.indexOf(10);
    print("${ll.indexOf(10)}");
  }
  // list api 判断元素是否包含 查找list中是否包含数字5
  void listApiConstains(){
    ll.contains(5);
    print("${ll.contains(5)}");
  }

}

/**
 * Dart中的map是将键和值相关联的对象。键和值都可以是任何类型的对象。
 * 每个键只出现一次，但您可以多次使用相同的值。
 * 
1.创建map有两种方式。
2.map的key类型不一致也不会报错。
3.添加元素的时候，会按照你添加元素的顺序逐个加入到map里面，哪怕你的key不连续。
比如key分别是 1,2,4，看起来有间隔，事实上添加到map的时候{1:value,2:value,4:value} 这种形式。
4.添加的元素的key如果是map里面某个key的英文，照样可以添加到map里面，
比如可以为3和key为three可以同时存在。
5.map里面的key不能相同，但是value可以相同,value可以为空字符串或者为null。
 */
class mapDemo{
  Map universitys = {1:"Bupt",2:"UESTC",3:"Tsinghua"};
  // 声明方式1 : 直接声明用{}表示，里面填写key和value，每组键值用逗号隔开
  void createMap(){
    Map companys = {"frist":"Alibaba","second":"Tencent","fifth":"Baidu"};
    print(companys);
  }
  // 声明方式2：先声明再赋值
  void createMapOne(){
    Map companys1 = new Map();
    companys1["first"] = "阿里巴巴";
    companys1["second"] = "腾讯";
    companys1["fifth"] = "百度";
    print(companys1);
  }
  // 常量map 要创建一个编译时常量const的map，请在map文字之前添加const
  void constMap(){
    final fruitConstantMap = const {2: "qapple",10:"origin",18:"banana"};
    print(fruitConstantMap);
  }
  // 添加元素 格式: 变量名[key] = value,其中key可以是不同类型。
  void mapApiAddElment(){
    //添加一个新的元素，key为“4”，value为“Peking”
      universitys[4] = "Peking";
      print(universitys);
  }
  // 修改元素。格式：变量名[key] = value
  void mapApiModfiyElment(){
      universitys[1] = "Oxford";
      print(universitys);
  }
  // 查询元素
  void mapApiFindElment(){
    bool mapKey =universitys.containsKey("1");
    bool mapValue = universitys.containsValue("value");
    print(mapKey); //结果为 True
    print(mapValue); //结果为 Flase
  } 
  // 删除元素.可以使用map的remove或者clear方法。
  void mapApiDelElment(){
    universitys.remove(4); //移除 4 的元素
    print(universitys); 

    // 清空map集合的数据
    universitys.clear(); 
    print(universitys);
  }
}

class runesDemo{
  runesDemo(){
      var clapping = '\u{1f44f}';
      print(clapping);
      print(clapping.codeUnits);
      print(clapping.runes.toList());
//使用String. fromCharCodes显示字符图形 
    Runes input = new Runes(
        '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
    print(new String.fromCharCodes(input));
  }
}



main(List<String> args) {
  numType type = new numType();
  type.numTypeOne();
  type.numTypeTwo();

  //被final或者const修饰的变量，变量类型可以省略
  const x = 2;
  print(x);

  //常量如果是类级别的，请使用 static const
  // static const speed = 100;

  String replaceStr = "Android Studio";
  // assert是断言，如果条件为true，继续进行，否则抛出异常，中断操作。

  /*
  assert 是Dart语言里的的断言函数，仅在Debug模式下有效。
  在开发过程中， 除非条件为真，否则会引发异常。(断言失败则程序立刻终止)。
   */
  assert( "你知道" +
    "${replaceStr.toUpperCase()}"
    + "最新版本是多少吗？" == 
    "你知道ANDROID STUDIO最新版本是多少吗?"
  );

  numCovertMethods numConvert = new numCovertMethods();
  numConvert.doubleToString();

  mapDemo demo =new mapDemo();
  demo.createMap();

} 