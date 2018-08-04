import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListViewSlidItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ListViewSlidItemState();
  }
}

class MyItem {
  bool showButton;
  String title;
  int index;
}

class _ListViewSlidItemState extends State<ListViewSlidItem> {
  List<MyItem> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = new List<MyItem>();
    for (var i = 0; i < 10; i++) {
      MyItem item = new MyItem();
      item.index = items.length;
      item.title = "index-$i";
      items.add(item);
    }
  }

  void sortList(){
    items.sort((a, b) {
      print("a:${a.index}");
      print("b:${b.index}");
      return a.index.compareTo(b.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: new Text("ListView"),
        ),
        body: new ListView.builder(
          itemCount: this.items.length,
          itemBuilder: (context, int index) {
            return listItem(items[index]);
          },
        )
        );
  }

  Widget listItem(MyItem item) {
    return new Slidable(
      delegate: new SlidableDrawerDelegate(),
      actionExtentRatio: 0.25,
      child: new Container(
        color: Colors.white,
        child: new ListTile(
          leading: new CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: new Text("${item.index}"),
            foregroundColor: Colors.white,
          ),
          title: new Text(item.title),
          subtitle: new Text('SlidableDrawerDelegate'),
        ),
      ),
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: 'UP',
          color: Colors.black45,
          icon: Icons.arrow_upward,
          // onTap: () => _showSnackBar(context, 'More ${item.index}'),
          onTap: item.index==0?null:()=>up(item),
        ),
        new IconSlideAction(
          caption: 'Down',
          color: Colors.red,
          icon: Icons.arrow_downward,
          onTap: item.index==items.length?null:() => down(item),
          // onTap: () => _showSnackBar(context, 'Delete ${item.index}'),
        ),
      ],
    );
  }

  void up(MyItem item){
    MyItem prevItem = items.elementAt(item.index-1);
    item.index -=1;
    prevItem.index +=1;
    sortList();
    setState(() {
        });
  }

  void down(MyItem item){
    MyItem nextItem = items.elementAt(item.index+1);
    item.index +=1;
    nextItem.index -=1;
    sortList();
    setState(() {
    });
  }

  void _showSnackBar(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text(text),
            contentPadding: EdgeInsets.only(bottom: 0.0),
            children: <Widget>[
              new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new FlatButton(
                        onPressed: () {},
                        padding: EdgeInsets.all(0.0),
                        child: new Container(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            height: 50.0,
                            width: 1000.0,
                            child: new Align(
                              alignment: Alignment.centerLeft,
                              child: new Text(
                                "编辑",
                                style: TextStyle(color: Colors.blue[300]),
                              ),
                            ))),
                    new Container(
                      height: 1.0,
                      color: Colors.grey[300],
                    ),
                    new FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(0.0),
                      child: new Container(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          height: 50.0,
                          width: 1000.0,
                          child: new Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              "删除",
                              style: TextStyle(color: Colors.red[300]),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
