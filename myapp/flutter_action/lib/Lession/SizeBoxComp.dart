import 'package:flutter/material.dart';

class SizeBoxComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('控制大小的容器'),
      ),
      body:sizeBoxComp() 
    );
  }


  Widget sizeBoxComp(){
    return new SizedBox(
        width: 150.0,
        height: 150.0,
        child: new Container(
         decoration: new BoxDecoration(
            color: Colors.red,
            shape: BoxShape.rectangle,
          ),
        ),
      );
  }
}