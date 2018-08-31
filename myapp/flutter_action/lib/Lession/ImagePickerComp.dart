import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
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



  // Future<RetMsg> _userAuth(String name, String pwd) async {
  //   RetMsg ret = new RetMsg(false, '');
  //   var url = '$Server_Oauth_URL';
  //   Map<String, String> queryParameters = {
  //     'grant_type': 'password',
  //     'client_id': 'ftrace-front',
  //     'client_secret': '1',
  //     'username': name,
  //     'password': pwd,
  //   };
  //   try {
  //     await http.post(url,
  //             encoding: Encoding.getByName("utf-8"),
  //             headers: {'Content-Type': 'application/x-www-form-urlencoded'},
  //             body: queryParameters)
  //         .then((response) {
  //       if (response.statusCode == HttpStatus.OK) {
  //         print("response.body:${response.body}");
  //         convertData(response.body);
  //         ret.success = true;
  //         ret.msg = "success";
  //       } else {
  //         print(
  //             "Error getting IP address:\nHttp status ${response.statusCode}");
  //         ret.success = false;
  //         ret.msg = "用户名或密码错误.";
  //       }
  //     });
  //   } catch (exception) {
  //     print(exception);
  //     ret.success = false;
  //     ret.msg = "请检查网络后重试.";
  //   }
  //   return ret;
  // }

}
