import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:core';

class BootomSheetComp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BootomSheetCompState();
  }
}

class _BootomSheetCompState extends State<BootomSheetComp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: new RaisedButton(
        child: new Text("点击"),
        onPressed: _onClick,
        color: Colors.red[100],
      ),
    );
  }

  void _onClick() {
    showModalBottomSheet<Null>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
              child: new Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: new Text('这是模态底部面板，点击任意位置即可关闭',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24.0))));
        });
  }
}
