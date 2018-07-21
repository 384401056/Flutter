import 'package:flutter/material.dart';

class PopupMenuComp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PopupMenuCompState();
}

class _PopupMenuCompState extends State<PopupMenuComp> {

  String _bodyStr = '显示菜单的点击';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('弹出菜单'), 
      actions: [
        popuMenuComp(),
      ] //弹出菜单
          ),
      body: new Center(
        child: new Text(_bodyStr)
        ),
    );
  }

  Widget popuMenuComp() {
    return new PopupMenuButton<String>(
        onSelected: (String value) {
          setState(() {
            _bodyStr = value;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              //value是选中时，传递给onSelected的参数.
              new PopupMenuItem<String>(value: '1', child: new Text('选项一')),
              new PopupMenuItem<String>(value: '2', child: new Text('选项二')),
              new PopupMenuItem<String>(value: '3', child: new Text('选项三'))
            ]);
  }
}
