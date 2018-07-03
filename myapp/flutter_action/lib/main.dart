import 'package:flutter/material.dart';
import 'package:flutter_action/Lession/ShoppingListItem.dart';
import 'package:flutter_action/Lession/ShoppingList.dart';
import 'package:flutter_action/Lession/CounterDisplay.dart';
import 'package:flutter_action/Lession/CustomText.dart';
import 'package:flutter_action/Lession/CustomImage.dart';
import 'package:flutter_action/Lession/LayoutRowColumn.dart';
import 'package:flutter_action/Lession/LayoutStack.dart';
import 'package:flutter_action/Lession/LayoutScroll.dart';
import 'package:flutter_action/Lession/AlignComponent.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: new ShoppingList(products: _kProducts,),//购物车列表。
      // home: new Counter(),//点击计数。
      // home: new CustomText(),//文字控件。
      // home:new CustomImage(),//图片控件
      // home:new LayoutRowColumn(),//行列布局
      // home:new LayoutStack(),//层叠布局
      // home:new LayoutScroll(),//滚动布局
      home:new AlignComponent(),//对齐控件
    );
  }


  final List<Product> _kProducts = <Product>[
  new Product(name: '鸡蛋'),
  new Product(name: '面粉'),
  new Product(name: '巧克力脆片'),
  new Product(name: '洗衣粉'),
  new Product(name: '餐巾纸'),
  new Product(name: '大米'),
];
}





