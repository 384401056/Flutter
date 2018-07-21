import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /**
    * 生成文字标题行
    */
    Widget buileTitleSesion() {
      return new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Row(
          children: [
            //expanded会拉伸，并使用所有剩余空闲空间
            new Expanded(
              //创建列视图
              child: new Column(
                //设置crossAxisAlignment属性值为CrossAxisAlignment.start，这会将将列中的子项左对齐。
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text('Oeschinen Lake Campground',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  new Text(
                    'Kandersteg, Switzerland',
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            // new Icon(
            //   Icons.star,
            //   color: Colors.red[500],
            // ),
            // new Text('41'),
            new FavoriteWidget(),
          ],
        ),
      );
    }

    /**
    * 生成按钮个体
    */
    Column buildButtonColumm(Color color, IconData icon, String lable) {
      //返回一个列视图。
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color), //图标
          //文字
          new Container(
            margin: const EdgeInsets.only(top: 6.0),
            child: new Text(
              lable,
              style: new TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
            ),
          ),
        ],
      );
    }

    /**
    * 生成按钮行, 传入可选参数。
    */
    Widget buildButtonSesion([color = Colors.blue]) {
      return new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildButtonColumm(color, Icons.call, "通话"),
            buildButtonColumm(color, Icons.near_me, "导航"),
            buildButtonColumm(color, Icons.share, "分享"),
          ],
        ),
      );
    }

    /**
     * 生成文本行
     */
    Widget buildTextSesion() {
      return new Container(
        padding: EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
        child: new Text(
          '''      Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
          ''',
          softWrap: true,
        ),
      );
    }

    Widget homePage() {
      return new Scaffold(
        appBar: AppBar(
          title: Text('Flutter布局实例'),
        ),
        //这里没有使用Column,是因为ListView会自动滚动
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover, //告诉框架，图像应该尽可能小，但覆盖整个渲染框
            ),
            buileTitleSesion(),
            buildButtonSesion(),
            buildTextSesion(),
            new TapboxA(),
            new ParentWidget(),
          ],
        ),
        //主页悬浮按钮.
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Colors.orange,
          tooltip: 'Add', // used by assistive technologies
          child: new Icon(
            Icons.add,
          ),
          onPressed: null,
        ),
      );
    }

    Widget homePage2(){
      return new ListView.builder(
        itemBuilder: (context, index) {
          return new Material(
            color: Colors.grey[300],
            child: new StickyHeader(
              header: new Container(
                height: 40.0,
                color: Colors.grey[400],
                padding: new EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: new Text('1',style: const TextStyle(color: Colors.black),
                ),
              ),
              content: new Container(
                height: 200.0,
                child:new Text("data"),
              ),
            ),
          );
        }
      );
    }

    return MaterialApp(
      title: 'Flutter Layout',
      theme: new ThemeData(primaryColor: Colors.green),
      home: homePage2(),
    );
  }
}

/**
 * 定义StatefulWidget类，需要以下两个类。
 * widget类，
 */
class FavoriteWidget extends StatefulWidget {
  @override
  State<FavoriteWidget> createState() => new _FavoriteWidgetState();
}

/**
 * 包含widget状态并定义该widget build()方法的类，它继承自State.
 */
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  num _favoriteCount = 4000;

  /**
   * IconButton的点击事件方法
   */
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
      } else {
        _favoriteCount += 1;
      }
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: EdgeInsets.all(0.0),
          child: new IconButton(
            iconSize: 30.0,
            icon: (_isFavorited
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite, //Iconbutton的点击事件。
          ),
        ),
        //当文本在40和41之间变化时，将文本放在SizedBox中并设置其宽度,可防止出现明显的“跳跃” ，因为这些值具有不同的宽度。
        new SizedBox(
          width: 40.0,
          child: new Container(
            child: new Text("$_favoriteCount"),
          ),
        ),
      ],
    );
  }
}

class TapboxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //GestureDetector手势探测器组件
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? "Active" : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 300.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  //将点击事件执行方法做为构造参数，从父类组件中传入。
  TapboxB({Key key, this.active: false, this.onChanged}) : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap, //点击事件执行方法.
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
