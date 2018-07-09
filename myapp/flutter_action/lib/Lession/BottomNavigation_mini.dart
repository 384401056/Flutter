import 'package:flutter/material.dart';

/**
 * 创建类，导航图标视图
 */
class NavigationIconView {
  // 类成员，存储图标
  final Widget _icon;
  // 类成员，存储颜色
  final Color _color;
  // 类成员，底部导航栏项目
  final BottomNavigationBarItem item;
  // 类成员，动画控制器
  final AnimationController controller;
  // 类成员，曲线动画
  CurvedAnimation _animation;
  /*
     * 构造函数
     * TickerProvider: Ticker提供者
     * 由类实现的接口，可以提供Ticker对象,Ticker对象：每个动画帧调用它的回调一次
     */
  NavigationIconView({
    Widget icon,
    Widget title,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        item = new BottomNavigationBarItem(
            icon: icon, // 项目的图标
            title: title // 项目的标题
            ),
        // 创建动画控制器
        controller = new AnimationController(
          duration: kThemeAnimationDuration, // 动画持续的时间长度：默认情况下主题更改动画的持续时间
          vsync: vsync, // 垂直同步
        ) {
    // 创建曲线动画
    _animation = new CurvedAnimation(
      parent: controller, // 应用曲线动画的动画
      /*
         * 正向使用的曲线：
         *  从0.5
         *  到1.0结束
         *  应用的曲线：快速启动并缓和到最终位置的曲线
         */
      curve: new Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  /*
   * 过渡转换函数
   * BottomNavigationBarType：定义底部导航栏的布局和行为
   * BuildContext：处理控件树中的控件
   */
  FadeTransition transition(BottomNavigationBarType type, BuildContext context) {
    Color iconColor; // 局部变量，存储图标颜色

    if (type == BottomNavigationBarType.shifting) {
      // 如果底部导航栏的位置和大小在点击时会变大
      iconColor = _color; // 存储颜色作为图标颜色
    } else {
      /*
       * 保存质感设计主题的颜色和排版值：
       *  使用ThemeData来配置主题控件
       *  使用Theme.of获取当前主题
       */
      final ThemeData themeData = Theme.of(context);
      /*
       * 如果程序整体主题的亮度很高（需要深色文本颜色才能实现可读的对比度）
       *  就返回程序主要部分的背景颜色作为图标颜色
       *  否则返回控件的前景颜色作为图标颜色
       */
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }

    //返回值，创建不透明度过渡控件
    return new FadeTransition(
      opacity: _animation, //不透明度的动画
      child: new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 0.0), // 此变量在动画开头的值
          end: Offset(0.0, 0.0), // 此变量在动画结尾处的值：左上角
        ).animate(_animation), //  返回给定动画，该动画接受由此对象确定的值
        child: new IconTheme(
          // 子控件：创建控制子控件的颜色，不透明度和大小的图标主题
          data: new IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: _icon, // 真正的图标子控件
        ),
      ),
    );
  }
}

// 创建类，自定义图标，继承StatelessWidget（无状态的控件）
class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 获取当前图标主题，创建与此图标主题相同的图标主题
    final IconThemeData iconTheme = IconTheme.of(context);

    return new Container(
      margin: const EdgeInsets.all(4.0), // 容器宽度：图标主题的宽度减8.0
      width: iconTheme.size - 8.0, // 容器宽度：图标主题的宽度减8.0
      height: iconTheme.size - 8.0, // 容器高度：图标主题的高度减8.0
      decoration: new BoxDecoration(
        // 子控件的装饰：创建一个装饰
        color: iconTheme.color, // 背景颜色：图标主题的颜色
      ),
    );
  }
}

// 创建类，菜单演示，继承StatefulWidget（有状态的控件）
class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigation();
  }
}

/*
 * 关联State子类的实例
 * 继承State：StatefulWidget（有状态的控件）逻辑和内部状态
 * 继承TickerProviderStateMixin，提供Ticker对象
 */
class _BottomNavigation extends State<BottomNavigation> with TickerProviderStateMixin {
  int _currentIndex = 2; // 存储底部导航栏的当前选择
  BottomNavigationBarType _type = BottomNavigationBarType.fixed; // 存储底部导航栏的布局和行为：在点击时会变大
  List<NavigationIconView> _navigationViews; // 存储NavigationIconView类的列表

  /*
   * 在对象插入到树中时调用
   * 框架将为它创建的每个State（状态）对象调用此方法一次
   * 覆盖此方法可以实现此对象被插入到树中的位置的初始化
   * 或用于配置此对象上的控件的位置的初始化
   */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 在存储NavigationIconView类的列表里添加内容
    _navigationViews = [
      new NavigationIconView(
        icon: new Icon(Icons.access_alarm),
        title: new Text('成就'),
        color: Colors.deepPurple[500],
        vsync: this,
      ),
      new NavigationIconView(
        //自定义的Icon控件。
        icon: new CustomIcon(),
        title: new Text('行动'),
        color: Colors.deepOrange[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.cloud),
        title: new Text('人物'),
        color: Colors.teal[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.favorite),
        title: new Text('财产'),
        color: Colors.indigo[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.event_available),
        title: new Text('设置'),
        color: Colors.pink[500],
        vsync: this,
      ),
    ];

    // 循环调用存储NavigationIconView类的列表的值
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild); // 每次动画控制器的值更改时调用侦听器
    }
    _navigationViews[_currentIndex].controller.value =
        1.0; // 底部导航栏当前选择的动画控制器的值为1.0
  }

  // 释放此对象使用的资源
  @override
  void dispose() {
    // 调用父类的内容
    super.dispose();
    // 循环调用存储NavigationIconView类的列表中的项
    for (NavigationIconView view in _navigationViews)
      view.controller.dispose(); // 调用此方法后，对象不再可用
  }

  // 动画控制器的值更改时的操作
  void _rebuild() {
    // 通知框架此对象的内部状态已更改
    setState(() {
      // 重建，以便为视图创建动画
    });
  }

  // 建立过渡堆栈
  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[]; //存储不透明度转换的列表
    for (NavigationIconView view in _navigationViews) // 循环调用存储NavigationIconView类的列表的值
      transitions.add(view.transition(_type, context)); // 在存储不透明度转换的列表中添加transition函数的返回值

    // 对存储不透明度转换的列表进行排序
    // transitions.sort((FadeTransition a, FadeTransition b) {
    //   final Animation<double> aAnimation = a.opacity;
    //   final Animation<double> bAnimation = b.opacity;
    //   double aValue = aAnimation.value;// aValue：a的动画值
    //   double bValue = bAnimation.value;// bValue：b的动画值
    //   /*
    //    * 将aValue与bValue进行比较
    //    *  返回一个负整数，aValue排序在bValue之前
    //    *  返回一个正整数，aValue排序在bValue之后
    //    */
    //   return aValue.compareTo(bValue);
    // });

    // 返回值，创建层叠布局控件
    return new Stack(children: transitions);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 局部变量，创建底部导航栏
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view)=>view.item).toList(),  
      currentIndex: _currentIndex,// 当前活动项的索引：存储底部导航栏的当前选择
      type: _type,// 底部导航栏的布局和行为：存储底部导航栏的布局和行为
      onTap: (int index){
          // 通知框架此对象的内部状态已更改
        setState((){
          _navigationViews[_currentIndex].controller.reverse(); // 当前选择的底部导航栏项目，开始反向运行此动画
          _currentIndex = index;// 更新存储底部导航栏的当前选择
          _navigationViews[_currentIndex].controller.forward();// 当前选择的底部导航栏项目，开始向前运行此动画
        });
      },
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('底部导航演示'),// 应用栏中显示的主要控件，包含程序当前内容描述的文本
        ),
      body: new Center(
        child:_buildTransitionsStack(),
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
