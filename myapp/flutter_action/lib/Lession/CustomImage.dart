import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('获取图像'),
      ),
      body: new Column(
        //从网络获取图片
        children: <Widget>[
          new Center(
            child: Image.network(
              'http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg',
              scale: 4.0,
            ),
          ),
          new Center(
            child: Image.asset(
              'images/03.jpg',
              width: 100.0,
              height: 150.0,
              fit: BoxFit.cover, //告诉框架，图像应该尽可能小，但覆盖整个渲染框
            ),
          ),
        ],
      ),
    );
  }
}
