import 'package:flutter/material.dart';

class SimpleDialogCompState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SimpleDialog(
        title: const Text('Select assignment'),
        children: <Widget>[
          new Center(
            child: new CircularProgressIndicator(
              
            ),
          ),
        ]
    ); 
  }

}