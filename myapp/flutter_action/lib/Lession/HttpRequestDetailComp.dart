import 'package:flutter/material.dart';

class HttpRequestDetailComp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HttpRequestDetailCompState();
  }

}


class _HttpRequestDetailCompState extends State<HttpRequestDetailComp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('网络请求'),
        centerTitle: true,
      ),
      body: new Container(
        child: new Text("HttpRequestDetailComp"), 
      ),
    );
  }

}