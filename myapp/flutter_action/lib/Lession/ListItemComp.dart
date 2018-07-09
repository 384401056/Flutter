import 'package:flutter/material.dart';

// 创建类，成就目标
class Target {
  // 常量，构建函数
  const Target(
      {this.name, // 自变量，目标名称
      this.reward // 自变量，目标奖励
      });
  final String name; // 最终值，成就目标名称
  final String reward; // 最终值，成就目标奖励
}

// 定义数据类型，目标改变回调
typedef void TargetChangedCallback(
    Target target, // 类型参数，目标
    bool nowTarget // 类型参数，是否新目标
    );

class AchievementViewItem extends StatelessWidget {
  final Target target; // 类成员，存储目标
  final bool nowTarget; // 类成员，存储是否新目标
  final TargetChangedCallback onTargetChanged; // 类成员，对目标的改变

  AchievementViewItem({this.target, this.nowTarget, this.onTargetChanged})
      : super(
            /*
       * 控件和元素的标识符：
       *  将其对象的标识用作其值
       *  用于将控件的标识绑定到用于生成该控件的对象的标识
       */
            key: new ObjectKey(target)) {}

  // 类函数，获得颜色
  Color _getColor(BuildContext context) {
    /*
     *  是否新目标
     *    是：返回灰色
     *    否：返回主题的背景色
     */
    return nowTarget ? Colors.black54 : Theme.of(context).primaryColor;
  }

  // 类函数，获得文本样式
  TextStyle _getNameTextStyle(BuildContext context) {
    // 如果不是新目标，返回文本样式控件
    if (!nowTarget)
      return new TextStyle(
        // 绘制文本的大小：16.0
        fontSize: 16.0,
        // 绘制文本时使用的颜色：黑色
        color: Colors.black,
        // 绘制文本时加粗字体
        fontWeight: FontWeight.bold,
      );
    // 返回文本样式控件
    return new TextStyle(
      fontSize: 16.0,
      // 绘制文本时使用的颜色：灰色
      color: Colors.black54,
      // 绘制文本时加粗字体
      fontWeight: FontWeight.bold,
      // 在文本附近绘制的装饰：文本中绘制一条横线
      decoration: TextDecoration.lineThrough,
    );
  }

  // 类函数，获得文本样式
  TextStyle _getRewardTextStyle(BuildContext context) {
    // 如果不是新目标，返回文本样式控件
    if (!nowTarget)
      return new TextStyle(
        // 绘制文本的大小：13.0
        fontSize: 13.0,
        // 绘制文本时使用的颜色：黑色
        color: Colors.black,
      );
    // 返回文本样式控件
    return new TextStyle(
      // 绘制文本的大小：13.0
      fontSize: 13.0,
      // 绘制文本时使用的颜色：灰色
      color: Colors.black54,
      // 在文本附近绘制的装饰：文本中绘制一条横线
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 返回值：创建列表项，通常包含图标和一些文本
    return new ListTile(
      // 当用户点击此列表项时调用
      onTap: () {
        // 调用对目标的改变函数
        onTargetChanged(target, !nowTarget);
      },
      // 要在标题之前显示的控件：创建圆形头像控件
      leading: new CircleAvatar(
        // 填充圆形的颜色：获得颜色函数
        backgroundColor: _getColor(context),
        // 子控件：文字控件
        child: new Text('囧'),
      ),
      title: new Stack(
        children: <Widget>[
          new Positioned(
            child: new Text(target.name, style: _getNameTextStyle(context)),
          ),
          new Positioned(
              child: new Text('奖励' + ':' + target.reward,style: _getRewardTextStyle(context),
          )),
        ],
      ),
      // 列表项目的主要内容：创建堆栈布局控件
      // title: new Stack(
      //     /*
      //  * 列表项目的主要内容：
      //  *  定位位置
      //  *    左边与顶部
      //  *  文本控件
      //  *    文本内容
      //  *    获得文本样式函数
      //  */
      //     children: <Widget>[
      //       new Positioned(
      //           left: 0.0,
      //           top: 0.0,
      //           width: 100.0,
      //           height: 100.0,
      //           child: new Text(
      //             target.name,
      //             style: _getNameTextStyle(context),
      //           )),
      //       new Positioned(
      //           left: 0.0,
      //           top: 20.0,
      //           width: 100.0,
      //           height: 100.0,
      //           child: new Text(
      //             '奖励' + '\n' + target.reward,
      //             style: _getRewardTextStyle(context),
      //           )),
      //     ])
    );
  }
}

class ListItemComp extends StatefulWidget {
  final List<Target> targets; // 最终值，目标列表

  ListItemComp({
    this.targets,
    Key key,
  }) : super(key: key) {}

  @override
  State<StatefulWidget> createState() => _ListItemComp();
}

class _ListItemComp extends State<ListItemComp> {
  Set<Target> _achievements = new Set<Target>(); // 类成员，存储成就集合

  /*
   * 类函数，成就改变
   *  target：传递目标
   *  nowTarget：是否新目标
   */
  void _achievementsChanged(Target target, bool nowTarget) {
    // 通知框架此对象的内部状态已更改
    setState(() {
      /*
       * 如果是新目标
       *  存储成就集合，增加目标
       *  否则，移除目标
       */
      if (nowTarget)
        _achievements.add(target);
      else
        _achievements.remove(target);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("列表项"),
      ),
      body: new ListView(
        children: widget.targets.map((Target target) {
          // 返回值，创建成就目标类
          return new AchievementViewItem(
            target: target, // 传递目标：本轮迭代中的目标
            nowTarget:
                _achievements.contains(target), // 是否新目标：如果目标在成就集合中，则返回true
            onTargetChanged: _achievementsChanged, // 对目标的改变：类函数，成就改变
          );
        }).toList(),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListItemComp(targets: _kTargets);
  }

  final List<Target> _kTargets = <Target>[
    new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
    new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
    new Target(name: '获得￥5000', reward: "获得信用卡"),
    new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
    new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
    new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
    new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
    new Target(name: '获得￥5000', reward: "获得信用卡"),
    new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
    new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
  ];
}
