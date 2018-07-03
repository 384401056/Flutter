import 'package:flutter/material.dart';

class LayoutStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('叠层布局'),
      ),
      body: layoutStack(),
    );
  }

  Widget layoutStack() {
    return new Center(
      child: new Stack(
        children: <Widget>[
          new Positioned(
            left: 10.0,
            top: 10.0,
            child: new Image.network('http://img2.cxtuku.com/00/13/12/s97783873391.jpg'),
          ),
          new Positioned(
            left: 30.0,
            top: 30.0,
            child: new Text(
              'Whatever is \n worth doing is \n worth doing \n well...',
              style: new TextStyle(
                fontSize: 20.0,
                fontFamily: 'serif',
              ),
            ),
          ),
           new Positioned(
            left: 100.0,
            top: 120.0,
            width: 100.0,
            height: 100.0,
            child: new Image.asset('images/03.jpg'),
          ),
        ],
      ),
    );
  }
}
