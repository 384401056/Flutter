import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_action/Lession/ShoppingList.dart';

class PullRefreshComp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PullRefreshCompState();
  }
}

class _PullRefreshCompState extends State<PullRefreshComp> {
  List<int> items = new List<int>();
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false; // 是否有请求正在进行

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDate();
    _scrollController.addListener(() {
      // print("pixels=${_scrollController.position.pixels}");
      // print("maxScrollExtent=${_scrollController.position.maxScrollExtent}");
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  Future<Null> loadDate() async {
    items = List.generate(20, (i) => i);
    setState(() {});
  }

  Future<List<int>> fakeRequest(int from, int to) async {
    // 如果对Future不熟悉，可以参考 https://juejin.im/post/5b2c67a351882574a756f2eb
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }

  _getMoreData() async {
    if (!isPerformingRequest) {
      // 判断是否有请求正在执行
      setState(() => isPerformingRequest = true);
      List<int> newEntries = await fakeRequest(items.length, items.length + 10);
      //添加一个动画没有更多数据的时候 ListView 向下移动覆盖正在加载更多数据的标志
      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: new Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }
      setState(() {
        items.addAll(newEntries);
        isPerformingRequest = false; // 下一个请求可以开始了
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Infinite ListView"),
      ),
      body: new RefreshIndicator(
        color: Colors.green,
        backgroundColor: Color(0xFFf7f6f7),
        onRefresh: loadDate,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(), //永远可以滚动。
          itemCount: items.length,
          itemBuilder: (context, index) {
            if (index == items.length - 1) {
              return _buildProgressIndicator();
            } else {
              return new GestureDetector(
                onTap: _onClick,
                child: new ListTile(title: new Text("Number $index")),
              );
            }
          },
          controller: _scrollController,
        ),
      ),
    );
  }

  _onClick() {
    setState(() {
      Navigator
          .of(context)
          .push(new MaterialPageRoute(builder: (BuildContext context) {
        return new Scaffold(
          appBar: new AppBar(
            title: Text("Infinite ListView"),
          ),
          body: new Text("Infinite ListView"),
        );
      }));
    });
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}
