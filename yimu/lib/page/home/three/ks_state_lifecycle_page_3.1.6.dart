import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';

class KSStateLifeCyclePage extends KSStatefulWidget {
  final int initValue;

  KSStateLifeCyclePage({this.initValue});

  @override
  State<StatefulWidget> createState() {
    return _KSStateLifeCyclePageState();
  }
}

class _KSStateLifeCyclePageState extends State<KSStateLifeCyclePage> {
  int _counter;

  /*当Widget第一次插入到Widget树时会被调用*/
  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    //初始化状态
    _print('initState');
  }

  _print(String func) {
    print('=========| ${func} |=========');
  }

  /*
  *1、在调用initState()之后。
  *2、在调用didUpdateWidget()之后。
  *3、在调用setState()之后。
  *4、在调用didChangeDependencies()之后。
  *5、在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
  */
  @override
  Widget build(BuildContext context) {
    _print('build');
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('${_counter}',style: TextStyle(fontSize: 32)),
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
            ),
            Container(
              child: Builder(builder: (context) {
                // 在Widget树中向上查找最近的父级`Scaffold` widget
                Scaffold scaffold = context.findAncestorWidgetOfExactType();
                // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
                return (scaffold.appBar as AppBar).title;
              }),
            )
          ],
        ),
      ),
    );
  }

  /*在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。正如之前所述，Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，也就是说在在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。*/
  @override
  void didUpdateWidget(KSStateLifeCyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _print('didUpdateWidget');
  }

  /*当State对象从树中被移除时，会调用此回调。在一些场景下，Flutter framework会将State对象重新插到树中，如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）。如果移除后没有重新插入到树中则紧接着会调用dispose()方法。*/
  @override
  void deactivate() {
    super.deactivate();
    _print('deactivate');
  }

  /*当State对象从树中被永久移除时调用；通常在此回调中释放资源。*/
  @override
  void dispose() {
    super.dispose();
    _print('dispose');
  }

  /*
  此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用
   */
  @override
  void reassemble() {
    super.reassemble();
    _print('reassemble');
  }
}
