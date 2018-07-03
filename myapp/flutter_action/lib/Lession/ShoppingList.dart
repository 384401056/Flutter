import 'package:flutter/material.dart';
import 'package:flutter_action/Lession/ShoppingListItem.dart';

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    return new _ShoppingList();
  }
}

class _ShoppingList extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物清单'),
      ),
      body: new ListView(
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product), //是否包含product
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
