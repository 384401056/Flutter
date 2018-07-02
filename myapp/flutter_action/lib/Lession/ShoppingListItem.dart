import 'package:flutter/material.dart';

typedef CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  //构造
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black45 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    return inCart
        ? null
        : new TextStyle(
            color: Colors.black45, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      contentPadding:
          EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
      //头像
      // leading: new CircleAvatar(
      //   backgroundColor: _getColor(context),
      //   child: new Text(product.name[0]),
      // ),
      leading: new Container(
          // color: _getColor(context),
          width: 120.0,
          height: 90.0,
          decoration: new BoxDecoration(
            color: _getColor(context),
            shape: BoxShape.rectangle,
            boxShadow: [new BoxShadow(
              color: Colors.black26,
              offset: Offset(7.0, 7.0)
            )],
            border: new Border.all(
              color: Colors.orange,
              width: 5.0,
            ),
          ),
          child: new Center(
            child: new Text(product.name[0], textAlign: TextAlign.center),
          )),
      // title: new Text(
      //   product.name,
      //   style: _getTextStyle(context),
      // ),
      title: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[new Text("this is title")],
          ),
          new Row(
            children: <Widget>[new Text("this is subtitle........")],
          ),
          new Row(
            children: <Widget>[new Text("this is subtitle........")],
          )
        ],
      ),
      // subtitle: new Text("dfafdjsakfljdksalfjd;s"),
      // trailing: new Text("data"),
    );
  }
}

class Product {
  const Product({this.name});
  final String name;
}
