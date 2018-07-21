import 'package:flutter/material.dart';

class PaddingComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('填充容器'),
      ),
      body: paddingComp(),
    );
  }

  Widget paddingComp(){
    return new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Image.network('http://up.qqjia.com/z/25/tu32710_4.jpg'),
      );
  }

}