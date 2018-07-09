import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_action/Lession/HttpRequestDetailComp.dart';

class HttpRequestComp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HttpRequestCompState();
  }
}

class _HttpRequestCompState extends State<HttpRequestComp> {
  Stream<List<News>> newsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化Wiget时就去获取数据。
    // newsList = getDate()?.asStream();
  }

  void refreshData() {
    newsList = null;
    setState(() {
      newsList = getDate()?.asStream();
    });
  }

  @override
  void dispose() {
    newsList = null;
    super.dispose();
  }

  void onItemClick() {
    setState(() {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new HttpRequestDetailComp()));
    });
  }

  /**
   * 
   */
  Future<List<News>> getDate() async {
    List<News> ret = new List<News>();
    var httpClient = new HttpClient();
    var uri = new Uri.http('news-at.zhihu.com', '/api/2/news/latest');
    try {
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        String jsonString = await response.transform(utf8.decoder).join();
        ret = convertData(jsonString);
        print("product newlist.length: ${ret.length}");
      } else {
        print('Error getting IP address:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print(exception);
    }
    return ret;
  }

  List<News> convertData(String jsonString) {
    List<News> ret = new List<News>();
    Map data = JSON.decode(jsonString);
    for (var item in data['news']) {
      News n = new News(item['title'], item['url'], item['image'],
          item['share_url'], item['thumbnail'], item['ga_prefix'], item['id']);
      ret.add(n);
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('网络请求'),
        centerTitle: true,
        actions: <Widget>[
          new Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: new IconButton(
              icon: new Icon(
                Icons.refresh,
                color: Colors.white,
                size: 40.0,
              ),
              onPressed: refreshData,
            ),
          ),
        ],
      ),
      body: new Container(
        child: new StreamBuilder<List<News>>(
          stream: this.newsList, //要订阅的数据变化.
          builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                //监视对象为null
                return new Center(
                  child: new Text('无数据，请刷新...'),
                );
              //等待监视对象的数据变化
              case ConnectionState.waiting:
                return new Center(
                  child: new CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return new Text('active');
              //监视对象有值了。
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return new Text('Error: ${snapshot.error}');
                } else {
                  if (snapshot.hasData) {
                    Iterable<Widget> listWiget =
                        snapshot.data.map((News device) {
                      return new Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: new Border(
                            bottom:
                                new BorderSide(color: Colors.green, width: 2.0),
                          ),
                        ),
                        child: new ListTile(
                          title: new Text("$device.id"),
                          subtitle: new Text(device.title),
                          trailing: new Text(device.ga_prefix),
                          onTap: onItemClick,
                        ),
                      );
                    });

                    //将可迭代以listWiget,通过listView.builder中的itemBulit方法，一个个返回给listView
                    return new ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return listWiget.elementAt(index);
                      },
                    );
                  } else {
                    return new Text("NoData!");
                  }
                }
            }
          },
        ),
      ),
    );
  }
}

class News {
  News(this.title, this.url, this.image, this.share_url, this.thumbnail,
      this.ga_prefix, this.id) {}

  final String title;
  final String url;
  final String image;
  final String share_url;
  final String thumbnail;
  final String ga_prefix;
  final int id;
}
