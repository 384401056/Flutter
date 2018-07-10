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
import 'package:flutter_action/Lession/PaddingComp.dart';
import 'package:flutter_action/Lession/SizeBoxComp.dart';
import 'package:flutter_action/Lession/DecorateComp.dart';
import 'package:flutter_action/Lession/OpacityComp.dart';
import 'package:flutter_action/Lession/PopupMenuComp.dart';
import 'package:flutter_action/Lession/BottomNavigation_mini.dart';
import 'package:flutter_action/Lession/ListItemComp.dart';
import 'package:flutter_action/Lession/HttpRequestComp.dart';
import 'package:flutter_action/Lession/PullRefreshComp.dart';

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
      // home:new AlignComponent(),//对齐控件
      // home:new PaddingComp(),//Padding控件
      // home:new SizeBoxComp(),//SizeBox控件
      // home:new DecorateComp(),//装饰容器,为子控件绘制之前或之后绘制一个装饰效果，如渐变效果。
      // home:new OpacityComp(),//透明度控件
      // home:new PopupMenuComp(),//弹出式菜单控件
      // home:new BottomNavigation(),//底部导航控件
      // home:new CustomListView(),//列表项(有问题)
      // home: new HttpRequestComp(),//http请求
      home:new PullRefreshComp(),
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





