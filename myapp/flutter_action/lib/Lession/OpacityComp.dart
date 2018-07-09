import 'package:flutter/material.dart';

class OpacityComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('透明度控件'),
        ),
        body: opacityComp());
  }

  Widget opacityComp() {
    return new Column(
      children: <Widget>[
        new Opacity(
          opacity: 0.2,
          child: new Container(
            color: Colors.black,
            width: 150.0,
            height: 150.0,
          ),
        ),
        new Opacity(
          opacity: 0.5,
          child: new Container(
            color: Colors.black,
            width: 150.0,
            height: 150.0,
          ),
        ),
        new Opacity(
          opacity: 1.0,
          child: new Container(
            color: Colors.black,
            width: 150.0,
            height: 150.0,
          ),
        ),
      ],
    );
  }
}
