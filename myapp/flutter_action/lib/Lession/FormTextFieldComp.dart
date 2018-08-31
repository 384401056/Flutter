import 'package:flutter/material.dart';

class FormTextFieldComp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FormTextField();
  }

}

class _FormTextField extends State<FormTextFieldComp>{

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String name;
  int number;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('新增商品'),
        leading: null,
        actions: <Widget>[
          new FlatButton(
            onPressed: _onSubmit,
            child: new Text("发布"),
          )
        ],
      ),
      body: formView(),
    );
  }

  Widget formView(){
    return new Form(
       key: _formKey,
        child: new Column(
          children: <Widget>[
            new TextFormField(
               //通过表单保存时使用最终值调用的可选方法
               onSaved: (val){
                  this.name = val;
                },
                validator: (val){
                      // return (val == null || val.isEmpty) ? "请输入商品名称": null;
                      bool match = new RegExp(r"^[a-zA-Z0-9\u4e00-\u9fa5]{1,12}$").hasMatch(val);
                  // bool match = new RegExp(r"^\d{1,12}$").hasMatch(val);
                   return match?null:"请输入1-12个字符";
                },
                decoration: new InputDecoration(
                  hintText: '商品名称',
                  errorStyle: TextStyle(color: Colors.orange)
                ),
              ),
            new TextFormField(
                onSaved: (val){
                  this.number = int.parse(val);
                },
                validator: (val){
                  bool match = new RegExp(r"^\d{1,12}$").hasMatch(val);
                   return match?null:"请输入1-12个数字";
                },
                decoration: new InputDecoration(
                  hintText: '商品数量'
                ),
              ),
          ],
        ),
      );
  }

  void _onSubmit() {
    final form = _formKey.currentState;
    if(form.validate()) {
      // form.save();
    //   showDialog(context: context, builder: (ctx)=> new AlertDialog(
    //     content:  new Text('$name, $number'),
    //   ));
    }
  }

}