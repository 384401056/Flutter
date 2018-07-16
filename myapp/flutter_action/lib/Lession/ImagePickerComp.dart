import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:core';

class ImagePickerComp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ImagePickerCompState();
  }
}

class _ImagePickerCompState extends State<ImagePickerComp> {
  File _image;
  List<Widget> imageButtons = new List<Widget>();
  int number = 5;

  _ImagePickerCompState() {
    imageButtons.add(new Container(
      height: 90.0,
      width: 90.0,
      color: Colors.green,
      child: new IconButton(
        icon: new Icon(Icons.add, color: Colors.white),
        onPressed: getImage,
      ),
    ));
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageButtons.add(new Container(
        height: 90.0,
        width: 90.0,
        color: Colors.green,
        child: new Image.file(image),
      ));
    }

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("图片选择"),
      ),
      body: new Container(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: imageButtons,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }

  // List<Widget> listImage() {}
  //  new Container(
  //             height: 90.0,
  //             width: 90.0,
  //             color: Colors.green,
  //             child: new IconButton(
  //               icon: new Icon(Icons.add,color: Colors.white),
  //               onPressed: getImage,),
  //           ),
}
