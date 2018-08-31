import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'dart:core';

class ImagePickerCropComp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ImagePickerCropCompState();
  }
}

class _ImagePickerCropCompState extends State<ImagePickerCropComp> {
  File imageFile = null;

  _ImagePickerCropCompState() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: new Text("图片选择"),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              IconButton(
                onPressed: _pickImage,
                iconSize: 80.0,
                icon: Icon(Icons.photo),
              ),
              IconButton(
                onPressed: _cropImage,
                 iconSize: 80.0,
                icon: Icon(Icons.broken_image),
              ),
              new Container(
                height: 200.0,
                width: 200.0,
                child: imageFile!=null?new Image.file(imageFile):new Text("无图片"),
              )
            ],
          ),
        ));
  }

  Future<Null> _pickImage() async {
    File pickFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      print("pickFile ImagePath:${pickFile.path}");
      pickFile.length().then((ret){
         print("pickFile ImageSize:${ret/1024/1024} M");
      });
      setState(() {
        imageFile = pickFile;
      });
    }
  }

  Future<Null> _cropImage() async {
    File pickFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
        File croppedFile = await ImageCropper.cropImage(
          sourcePath: pickFile.path,
          ratioX: 16.0,
          ratioY: 9.0,
          toolbarTitle: "裁剪图片",
          toolbarColor: Colors.blue);
      if (croppedFile != null) {
        print("croppedFile ImagePath:${croppedFile.path}");
        croppedFile.length().then((ret){
          print("croppedFile ImageSize:${ret/1024/1024} M");
        });
        setState(() {
          imageFile = croppedFile;
        });
      }
    }
    
  }
}
