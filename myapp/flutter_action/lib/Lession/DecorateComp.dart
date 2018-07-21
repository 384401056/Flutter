import 'package:flutter/material.dart';

class DecorateComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('装饰容器'),
      ),
      body:decorateComp() 
    );
  }


  Widget decorateComp(){
    return new DecoratedBox(
      decoration: new BoxDecoration(
        //渐变属性。
        gradient: new LinearGradient(
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
            colors: <Color>[const Color(0xffff2cc), const Color(0xffff6eb4)],
          ),
      ),
      child: new Container(
          width: 250.0,
          height: 250.0,
        ),
    );
  }
}