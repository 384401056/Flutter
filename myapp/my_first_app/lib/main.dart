import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

final _suggestions = <WordPair>[]; //保存建议的单词对

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();//随机生成英文单词。
    //生成模拟数据
    _suggestions.clear();
    _suggestions.addAll(generateWordPairs().take(100)); //生成100个单词对，然后添加到建议列表
    return new MaterialApp(
      title: 'Welcome to Flutter',

      //修改APP主题颜色
      theme: new ThemeData(
        primaryColor: Colors.orange,
      ),

      home: new RandomWords(),
    );
  }
}

/**
 * StatefulWidget 持有的状态可在widget生命周期中发生变化
 */
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<StatefulWidget> {
  final _saved = new Set<WordPair>(); //这个集合存储用户喜欢（收藏）的单词对。
  final _biggerFont = const TextStyle(fontSize: 18.0); //字体

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        // leading: new IconButton(
        //     icon: new Icon(Icons.backspace), onPressed: _pushSaved), //左边按钮
        title: new Text('Startup Name Generator'), //标题文字
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.menu), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  /**
   * 当用户点击导航栏中的列表图标时，建立一个路由并将其推入到导航管理器栈中。此操作会切换页面以显示新路由。
   * 新页面的内容在在MaterialPageRoute的builder属性中构建，builder是一个匿名函数。
   * 添加Navigator.push调用，这会使路由入栈（以后路由入栈均指推入到导航管理器的栈）
   */
  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
            title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ));
      });

      final divided = ListTile
          .divideTiles(
            context: context,
            tiles: _saved.map((pair) {
              return new ListTile(
                  title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ));
            }),
            color: Colors.orange, //item分隔线颜色。
          )
          .toList();

      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Save suggestions"),
        ),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }

  /**
   * ListView
   */
  Widget _buildSuggestions() {
    final divided = ListTile
        .divideTiles(
          context: context,
          //遍历_suggesutions 生成一个ListTile迭代器
          tiles: _suggestions.map((pair) {
            bool alreadySaved = _saved.contains(pair); //判断pair是否在于_saved中。
            int index = _suggestions.indexOf(pair);
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
              subtitle: new Text("index this is $index"),
              trailing: new Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).primaryColor, //使用APP主题的颜色
              ),
              //用户点击
              onTap: () {
                //在Flutter的响应式风格的框架中，调用setState() 会为State对象触发build()方法，从而导致对UI的更新
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(pair);
                  } else {
                    _saved.add(pair);
                  }
                });
              },
            );
          }),
          color: Colors.orange, //item分隔线颜色。
        )
        .toList();

    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Save suggestions"),
      // ),
      body: new ListView(
        children: divided,
      ),
    );

    //=======上面的方式生成ListView,只能把个数已知的ListTile一起返回。但下面这种方式，可以返回个数不确定的ListView=============
    // print("_suggestions.lenght=${_suggestions.length}");
    // return new ListView.builder(
    //   padding: const EdgeInsets.all(16.0),
    //   itemBuilder: (context, i) {
    //     print("index=$i");
    //     // 在每一行数据之前(如果是奇数行)，添加一个1像素高的分隔线widget
    //     if (i.isOdd) {
    //       return new Divider(color: Colors.blue);
    //     }
    //     // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
    //     // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
    //     final index = i ~/ 2;
    //     // 如果是建议列表中最后一个单词对
    //     if (index >= _suggestions.length) {
    //       _suggestions.addAll(generateWordPairs().take(10)); //接着再生成10个单词对，然后添加到建议列表
    //       // return null;
    //     }
    //     //对于每一个单词对，_buildSuggestions函数都会调用一次_buildRow
    //     return _buildRow(_suggestions[index], index);
    //   },
    // );
  }

  /**
   * ListItem
   */
  Widget _buildRow(WordPair pair, int index) {
    final alreadySaved = _saved.contains(pair);
    print("BuildRowIndex=$index");
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: new Text("index this is $index"),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : Colors.blue,
      ),
      //用户点击
      onTap: () {
        //在Flutter的响应式风格的框架中，调用setState() 会为State对象触发build()方法，从而导致对UI的更新
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
