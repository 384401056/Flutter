import 'package:flutter/material.dart';

class AlignComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('对齐控件'),
      ),
      body: alignComponent(),
    );
  }

  Widget alignComponent(){
    return new Stack(
      children: <Widget>[
        new Align(
          alignment: Alignment.topCenter,
          child: new Text("Alignment.topCenter"),
        ),
        new Align(
          alignment: Alignment.topCenter,
          child: new Image.asset('images/03.jpg')
        ),
        new Align(
          alignment: Alignment.topCenter,
          child: new Text("Alignment.topCenter"),
        ),
      ],
    );
  }

}